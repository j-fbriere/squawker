import 'dart:convert';

import 'package:squawker/group/group_model.dart';
import 'package:logging/logging.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_migration_plan/migration/sql.dart';
import 'package:sqflite_migration_plan/sqflite_migration_plan.dart';
import 'package:uuid/uuid.dart';

const String databaseName = 'squawker.db';

const String tableFeedGroupChunk = 'feed_group_chunk';
const String tableFeedGroupCursor = 'feed_group_cursor';
const String tableFeedGroupPositionState = 'feed_group_position_state';

const String tableSavedTweet = 'saved_tweet';
const String tableSearchSubscription = 'search_subscription';
const String tableSearchSubscriptionGroupMember = 'search_subscription_group_member';
const String tableSubscription = 'subscription';
const String tableSubscriptionGroup = 'subscription_group';
const String tableSubscriptionGroupMember = 'subscription_group_member';
const String tableRateLimits = 'rate_limits';
const String tableTwitterToken = 'twitter_token';
const String tableTwitterProfile = 'twitter_profile';

const String tableAccounts = 'accounts';

class Repository {
  static final log = Logger('Repository');

  static Future<Database> readOnly() async {
    return openDatabase(databaseName, readOnly: true, singleInstance: false);
  }

  static Future<Database> writable() async {
    return openDatabase(databaseName);
  }

  Future<bool> migrate() async {
    MigrationPlan myMigrationPlan = MigrationPlan({
      2: [
        SqlMigration(
            'CREATE TABLE IF NOT EXISTS following (id INTEGER PRIMARY KEY, screen_name VARCHAR, name VARCHAR, profile_image_url_https VARCHAR, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)'),
      ],
      3: [
        SqlMigration(
            'CREATE TABLE IF NOT EXISTS following_group (id INTEGER PRIMARY KEY, name VARCHAR NOT NULL, icon VARCHAR NOT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)'),
        SqlMigration('CREATE TABLE IF NOT EXISTS following_group_profile (group_id INTEGER, profile_id INTEGER)')
      ],
      4: [
        // Change the following table's "id" field to be a VARCHAR
        SqlMigration('ALTER TABLE following RENAME TO following_old'),
        SqlMigration(
            'CREATE TABLE following (id VARCHAR PRIMARY KEY, screen_name VARCHAR, name VARCHAR, profile_image_url_https VARCHAR, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)'),
        SqlMigration(
            'INSERT INTO following (id, screen_name, name, profile_image_url_https, created_at) SELECT id, screen_name, name, profile_image_url_https, created_at FROM following_old'),
        SqlMigration('DROP TABLE following_old')
      ],
      5: [
        // Change the following_group_profile table's "profile_id" field to be a VARCHAR to match the referenced table
        SqlMigration('ALTER TABLE following_group_profile RENAME TO following_group_profile_old'),
        SqlMigration('CREATE TABLE following_group_profile (group_id INTEGER, profile_id VARCHAR)'),
        SqlMigration(
            'INSERT INTO following_group_profile (group_id, profile_id) SELECT group_id, profile_id FROM following_group_profile_old'),
        SqlMigration('DROP TABLE following_group_profile_old')
      ],
      6: [
        // Rename the old following tables to match the names in the UI
        SqlMigration('ALTER TABLE following RENAME TO $tableSubscription'),
        SqlMigration('ALTER TABLE following_group RENAME TO $tableSubscriptionGroup'),
        SqlMigration('ALTER TABLE following_group_profile RENAME TO $tableSubscriptionGroupMember'),
      ],
      7: [
        // Add the table for saved tweets
        SqlMigration(
            'CREATE TABLE IF NOT EXISTS $tableSavedTweet (id VARCHAR PRIMARY KEY, content TEXT NOT NULL, saved_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)',
            reverseSql: 'DROP TABLE $tableSavedTweet')
      ],
      8: [
        // Add a primary key to the $TABLE_SUBSCRIPTION_GROUP_MEMBER table to prevent duplicates
        SqlMigration('ALTER TABLE $tableSubscriptionGroupMember RENAME TO ${tableSubscriptionGroupMember}_old'),
        SqlMigration(
            'CREATE TABLE $tableSubscriptionGroupMember (group_id INTEGER, profile_id VARCHAR, CONSTRAINT pk_$tableSubscriptionGroupMember PRIMARY KEY (group_id, profile_id))'),
        SqlMigration(
            'INSERT INTO $tableSubscriptionGroupMember (group_id, profile_id) SELECT group_id, profile_id FROM ${tableSubscriptionGroupMember}_old'),
        SqlMigration('DROP TABLE ${tableSubscriptionGroupMember}_old')
      ],
      9: [
        // Add a new ID field for subscription groups for a UUID to determine uniqueness across devices
        SqlMigration('ALTER TABLE $tableSubscriptionGroup ADD COLUMN uuid VARCHAR NULL'),
        SqlMigration('ALTER TABLE $tableSubscriptionGroupMember ADD COLUMN group_uuid VARCHAR NULL'),

        // Generate a UUID for each existing subscription group
        Migration(Operation((db) async {
          var uuid = const Uuid();

          // Update the existing subscription group and all of its members with the new ID
          var groups = await db.query(tableSubscriptionGroup);
          for (var group in groups) {
            var oldId = group['id'];
            var newId = uuid.v4();

            db.update(tableSubscriptionGroup, {'uuid': newId}, where: 'id = ?', whereArgs: [oldId]);

            db.update(tableSubscriptionGroupMember, {'group_uuid': newId}, where: 'group_id = ?', whereArgs: [oldId]);
          }
        })),

        // Replace the old ID fields with the new ones
        SqlMigration('ALTER TABLE $tableSubscriptionGroup RENAME TO ${tableSubscriptionGroup}_old'),
        SqlMigration(
            'CREATE TABLE $tableSubscriptionGroup (id VARCHAR PRIMARY KEY, name VARCHAR NOT NULL, icon VARCHAR NOT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)'),
        SqlMigration(
            'INSERT INTO $tableSubscriptionGroup (id, name, icon, created_at) SELECT uuid, name, icon, created_at FROM ${tableSubscriptionGroup}_old'),

        SqlMigration('ALTER TABLE $tableSubscriptionGroupMember RENAME TO ${tableSubscriptionGroupMember}_old'),
        SqlMigration(
            'CREATE TABLE $tableSubscriptionGroupMember (group_id VARCHAR, profile_id VARCHAR, CONSTRAINT pk_$tableSubscriptionGroupMember PRIMARY KEY (group_id, profile_id))'),
        SqlMigration(
            'INSERT INTO $tableSubscriptionGroupMember (group_id, profile_id) SELECT group_uuid, profile_id FROM ${tableSubscriptionGroupMember}_old'),
      ],
      10: [
        // Drop the old subscription group tables now that we've replaced the IDs
        SqlMigration('DROP TABLE ${tableSubscriptionGroup}_old'),
        SqlMigration('DROP TABLE ${tableSubscriptionGroupMember}_old'),
      ],
      11: [
        // Add columns for the subscription group settings
        SqlMigration('ALTER TABLE $tableSubscriptionGroup ADD COLUMN include_replies BOOLEAN DEFAULT true'),
        SqlMigration('ALTER TABLE $tableSubscriptionGroup ADD COLUMN include_retweets BOOLEAN DEFAULT true')
      ],
      12: [
        // Insert a dummy record for the "All" subscription group
        Migration(Operation((db) async {
          await db.insert(tableSubscriptionGroup, {'id': '-1', 'name': 'All', 'icon': 'rss_feed_rounded'},
              conflictAlgorithm: ConflictAlgorithm.replace);
        }), reverse: Operation((db) async {
          await db.delete(tableSubscriptionGroup, where: 'id = ?', whereArgs: ['-1']);
        })),
      ],
      13: [
        // Duplicate migration 12, as some people had deleted the "All" group when it displayed twice in the groups list
        Migration(Operation((db) async {
          await db.insert(tableSubscriptionGroup, {'id': '-1', 'name': 'All', 'icon': 'rss_feed_rounded'},
              conflictAlgorithm: ConflictAlgorithm.replace);
        }), reverse: Operation((db) async {
          await db.delete(tableSubscriptionGroup, where: 'id = ?', whereArgs: ['-1']);
        })),
      ],
      14: [
        // Add a "verified" column to the subscriptions table
        SqlMigration('ALTER TABLE $tableSubscription ADD COLUMN verified BOOLEAN DEFAULT 0')
      ],
      15: [
        // Re-apply migration 14 in a different way, as it looks like it didn't apply for some people
        SqlMigration('ALTER TABLE $tableSubscription RENAME TO ${tableSubscription}_old'),
        SqlMigration(
            'CREATE TABLE $tableSubscription (id VARCHAR PRIMARY KEY, screen_name VARCHAR, name VARCHAR, profile_image_url_https VARCHAR, verified BOOLEAN DEFAULT 0, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)'),
        SqlMigration(
            'INSERT INTO $tableSubscription (id, screen_name, name, profile_image_url_https, created_at) SELECT id, screen_name, name, profile_image_url_https, created_at FROM ${tableSubscription}_old'),
        SqlMigration('DROP TABLE ${tableSubscription}_old'),
      ],
      16: [
        // Add a "color" column to the subscription groups table, and set a default icon for existing groups
        SqlMigration('ALTER TABLE $tableSubscriptionGroup ADD COLUMN color INT DEFAULT NULL'),

        Migration(Operation((db) async {
          await db.update(tableSubscriptionGroup, {'icon': defaultGroupIcon},
              where: "icon IS NULL OR icon = '' OR icon = ?", whereArgs: ['rss_feed_rounded']);
        }))
      ],
      17: [
        // Add some tables to temporarily store feed chunks, used for caching and pagination
        SqlMigration(
            'CREATE TABLE IF NOT EXISTS $tableFeedGroupCursor (id INTEGER PRIMARY KEY, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)',
            reverseSql: 'DROP TABLE $tableFeedGroupCursor'),
        SqlMigration(
            'CREATE TABLE IF NOT EXISTS $tableFeedGroupChunk (cursor_id INTEGER NOT NULL, hash VARCHAR NOT NULL, cursor_top VARCHAR, cursor_bottom VARCHAR, response VARCHAR, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)',
            reverseSql: 'DROP TABLE $tableFeedGroupChunk'),
      ],
      18: [
        // Add support for saving searches
        SqlMigration(
            'CREATE TABLE IF NOT EXISTS $tableSearchSubscription (id VARCHAR PRIMARY KEY, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)',
            reverseSql: 'DROP TABLE $tableSearchSubscription'),
        SqlMigration(
            'CREATE TABLE IF NOT EXISTS $tableSearchSubscriptionGroupMember (group_id VARCHAR, search_id VARCHAR, CONSTRAINT pk_$tableSearchSubscription PRIMARY KEY (group_id, search_id))',
            reverseSql: 'DROP TABLE $tableSearchSubscriptionGroupMember'),
      ],
      19: [
        // Add a new column for saved tweet user IDs, and extract them from all existing records
        SqlMigration('ALTER TABLE $tableSavedTweet ADD COLUMN user_id VARCHAR DEFAULT NULL'),
        Migration(Operation((db) async {
          var tweets = await db.query(tableSavedTweet, columns: ['id', 'content']);
          var batch = db.batch();

          for (var tweet in tweets) {
            var content = tweet['content'] as String?;
            if (content == null) {
              continue;
            }

            var decodedTweet = jsonDecode(content);
            if (decodedTweet == null) {
              continue;
            }

            var userId = decodedTweet['user']?['id_str'] as String?;
            if (userId != null) {
              batch.update(tableSavedTweet, {'user_id': userId}, where: 'id = ?', whereArgs: [tweet['id']]);
            }
          }

          await batch.commit();
        })),
      ],
      20: [
        Migration(Operation((db) async {
          await db.update(tableSubscriptionGroup, {'icon': defaultGroupIcon},
              where: "icon IS NULL OR icon = '' OR icon = ?", whereArgs: ['rss']);
        }))
      ],
      21: [
        Migration(Operation((db) async {
          await db.delete(tableFeedGroupChunk);
        })),
        SqlMigration('CREATE TABLE IF NOT EXISTS feed_group_offset (group_id VARCHAR, offset REAL)',
          reverseSql: 'DROP TABLE IF EXISTS feed_group_offset'),
      ],
      22: [
        SqlMigration('DROP TABLE IF EXISTS feed_group_offset'),
        SqlMigration('DROP TABLE IF EXISTS $tableFeedGroupCursor'),
        SqlMigration('DROP TABLE IF EXISTS $tableFeedGroupChunk'),
        SqlMigration('CREATE TABLE IF NOT EXISTS $tableFeedGroupChunk (group_id VARCHAR, hash VARCHAR NOT NULL, cursor_top VARCHAR, cursor_bottom VARCHAR, response VARCHAR, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)'),
        SqlMigration('CREATE TABLE IF NOT EXISTS $tableFeedGroupPositionState (group_id VARCHAR, chain_id VARCHAR, tweet_id VARCHAR)',
            reverseSql: 'DROP TABLE IF EXISTS $tableFeedGroupPositionState'),
      ],
      23: [
        Migration(Operation((db) async {
          await db.delete(tableFeedGroupChunk);
          await db.delete(tableFeedGroupPositionState);
        })),
        SqlMigration('CREATE TABLE IF NOT EXISTS guest_account (id_str VARCHAR, screen_name VARCHAR, oauth_token VARCHAR, oauth_token_secret VARCHAR, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)',
            reverseSql: 'DROP TABLE IF EXISTS guest_account'),
      ],
      24: [
        SqlMigration('CREATE TABLE IF NOT EXISTS $tableRateLimits (remaining VARCHAR, reset VARCHAR)',
            reverseSql: 'DROP TABLE IF EXISTS $tableRateLimits'),
      ],
      25: [
        SqlMigration('ALTER TABLE $tableSubscription ADD COLUMN in_feed BOOLEAN DEFAULT 1'),
      ],
      26: [
        SqlMigration('ALTER TABLE $tableRateLimits ADD COLUMN oauth_token VARCHAR DEFAULT NULL'),
      ],
      27: [
        SqlMigration('ALTER TABLE guest_account RENAME TO $tableTwitterToken'),
        SqlMigration('ALTER TABLE $tableTwitterToken ADD COLUMN guest BOOLEAN DEFAULT 1'),
        SqlMigration('CREATE TABLE IF NOT EXISTS $tableTwitterProfile (username VARCHAR, password VARCHAR, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, name VARCHAR, email VARCHAR, phone VARCHAR)',
            reverseSql: 'DROP TABLE IF EXISTS $tableTwitterProfile'),
      ],
      28: [
        SqlMigration('CREATE TABLE ${tableTwitterToken}_2 AS SELECT DISTINCT * FROM $tableTwitterToken'),
        SqlMigration('DROP TABLE $tableTwitterToken'),
        SqlMigration('CREATE TABLE $tableTwitterToken (oauth_token VARCHAR PRIMARY KEY, oauth_token_secret VARCHAR, id_str VARCHAR, screen_name VARCHAR, guest BOOLEAN, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)'),
        SqlMigration('INSERT INTO $tableTwitterToken (oauth_token, oauth_token_secret, id_str, screen_name, guest, created_at) SELECT oauth_token, oauth_token_secret, id_str, screen_name, guest, created_at FROM ${tableTwitterToken}_2'),
        SqlMigration('DROP TABLE ${tableTwitterToken}_2'),

        SqlMigration('CREATE TABLE ${tableTwitterProfile}_2 AS SELECT DISTINCT * FROM $tableTwitterProfile'),
        SqlMigration('DROP TABLE $tableTwitterProfile'),
        SqlMigration('CREATE TABLE $tableTwitterProfile (username VARCHAR PRIMARY KEY, password VARCHAR, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, name VARCHAR, email VARCHAR, phone VARCHAR)'),
        SqlMigration('INSERT INTO $tableTwitterProfile (username, password, created_at, name, email, phone) SELECT username, password, created_at, name, email, phone FROM ${tableTwitterProfile}_2'),
        SqlMigration('DROP TABLE ${tableTwitterProfile}_2')
      ],
      29: [
        Migration(Operation((db) async {
          var tokens = await db.rawQuery('SELECT screen_name, oauth_token, MAX(created_at) FROM $tableTwitterToken WHERE guest = 0 GROUP BY screen_name');
          for (var token in tokens) {
            var screenName = token['screen_name'] as String;
            var oauthToken = token['oauth_token'] as String;
            await db.delete(tableTwitterToken, where: 'screen_name = ? AND oauth_token != ?', whereArgs: [screenName, oauthToken]);
            var profiles = await db.query(tableTwitterProfile, where: 'lower(username) = lower(?)', whereArgs: [screenName]);
            var password, name, email, phone;
            for (var profile in profiles) {
              password ??= profile['password'];
              name ??= profile['name'];
              email ??= profile['email'];
              phone ??= profile['phone'];
            }
            await db.delete(tableTwitterProfile, where: 'lower(username) = lower(?)', whereArgs: [screenName]);
            await db.insert(tableTwitterProfile, {'username': screenName, 'password': password, 'name': name, 'email': email, 'phone': phone});
          }
        }))
      ],
      30: [
        Migration(Operation((db) async {
          await db.delete(tableTwitterToken, where: "screen_name IS NULL OR screen_name = '' OR id_str IS NULL OR id_str = '' OR oauth_token IS NULL OR oauth_token = '' OR oauth_token_secret IS NULL OR oauth_token_secret = '' OR guest IS NULL OR created_at IS NULL OR created_at = ''");
          await db.delete(tableTwitterProfile, where: "username IS NULL OR username = '' OR password IS NULL OR password = '' OR created_at IS NULL OR created_at = ''");

          await db.rawQuery('CREATE TABLE ${tableTwitterToken}_2 AS SELECT DISTINCT * FROM $tableTwitterToken');
          await db.rawQuery('DROP TABLE $tableTwitterToken');
          await db.rawQuery('CREATE TABLE $tableTwitterToken (oauth_token VARCHAR NON NULL PRIMARY KEY, oauth_token_secret VARCHAR NON NULL, id_str VARCHAR NON NULL, screen_name VARCHAR NON NULL, guest BOOLEAN NON NULL, created_at TIMESTAMP NON NULL DEFAULT CURRENT_TIMESTAMP)');
          await db.rawQuery('INSERT INTO $tableTwitterToken (oauth_token, oauth_token_secret, id_str, screen_name, guest, created_at) SELECT oauth_token, oauth_token_secret, id_str, screen_name, guest, created_at FROM ${tableTwitterToken}_2');
          await db.rawQuery('DROP TABLE ${tableTwitterToken}_2');

          await db.rawQuery('CREATE TABLE ${tableTwitterProfile}_2 AS SELECT DISTINCT * FROM $tableTwitterProfile');
          await db.rawQuery('DROP TABLE $tableTwitterProfile');
          await db.rawQuery('CREATE TABLE $tableTwitterProfile (username VARCHAR NON NULL PRIMARY KEY, password VARCHAR NON NULL, created_at TIMESTAMP NON NULL DEFAULT CURRENT_TIMESTAMP, name VARCHAR, email VARCHAR, phone VARCHAR)');
          await db.rawQuery('INSERT INTO $tableTwitterProfile (username, password, created_at, name, email, phone) SELECT username, password, created_at, name, email, phone FROM ${tableTwitterProfile}_2');
          await db.rawQuery('DROP TABLE ${tableTwitterProfile}_2');

          var tokens = await db.rawQuery('SELECT t.oauth_token, p.username FROM $tableTwitterToken t LEFT JOIN $tableTwitterProfile p ON t.screen_name = p.username WHERE t.guest = 0 AND p.username IS NULL');
          if (tokens.isNotEmpty) {
            var oauthTokenLst = tokens.map((e) => e['oauth_token'] as String).toList();
            await db.delete(tableTwitterToken, where: 'oauth_token IN (${List.filled(oauthTokenLst.length, '?').join(',')})', whereArgs: oauthTokenLst);
          }

          var profiles = await db.rawQuery('SELECT p.username, t.oauth_token FROM $tableTwitterProfile p LEFT JOIN $tableTwitterToken t ON p.username = t.screen_name WHERE t.oauth_token IS NULL');
          if (profiles.isNotEmpty) {
            var usernameLst = profiles.map((e) => e['username'] as String).toList();
            await db.delete(tableTwitterProfile, where: 'username IN (${List.filled(usernameLst.length, '?').join(',')})', whereArgs: usernameLst);
          }
        }))
      ],
      31: [
        // create table for storing twitter accounts
        SqlMigration(
            'CREATE TABLE IF NOT EXISTS $tableAccounts (id TEXT PRIMARY KEY, password TEXT, email TEXT, auth_header VARCHAR)'),
      ],
    });
    await openDatabase(
      databaseName,
      version: 31,
      onUpgrade: myMigrationPlan,
      onCreate: myMigrationPlan,
      onDowngrade: myMigrationPlan,
    );

    // Clean up any old feed chunks and cursors
    var repository = await writable();

    await repository.delete(tableFeedGroupChunk, where: "created_at <= date('now', '-7 day')");

    int version = await repository.getVersion();

    log.info('Finished migrating database version $version');

    return true;
  }
}
