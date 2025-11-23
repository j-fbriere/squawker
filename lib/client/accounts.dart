import 'package:squawker/database/repository.dart';
import 'package:squawker/database/entities.dart';

Future<List<Account>> getAccounts() async {
  var database = await Repository.readOnly();
  List<Map<String, Object?>> lst = await database.query(tableAccounts);
  return lst.map((map) => Account.fromMap(map)).toList();
}
