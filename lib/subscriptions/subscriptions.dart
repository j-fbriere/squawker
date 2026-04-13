import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:squawker/home/home_screen.dart';
import 'package:squawker/subscriptions/_import.dart';
import 'package:squawker/subscriptions/_list.dart';
import 'package:squawker/subscriptions/users_model.dart';
import 'package:provider/provider.dart';

class SubscriptionsScreen extends StatelessWidget {
  const SubscriptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.current.subscriptions),
        actions: [
          IconButton(
            icon: const Icon(Symbols.cloud_download_rounded),
            onPressed: () =>
                showModalBottomSheet(context: context, builder: (BuildContext c) => const SubscriptionImportScreen()),
          ),
          // uses api 1.1 which is not working anymore
          /*
          IconButton(
            icon: const Icon(Symbols.refresh_rounded),
            onPressed: () async {
              await context.read<SubscriptionsModel>().refreshSubscriptionData();
            },
          ),
          */
          PopupMenuButton<String>(
            icon: const Icon(Symbols.sort_rounded),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'name',
                child: Text(L10n.of(context).name),
              ),
              PopupMenuItem(
                value: 'screen_name',
                child: Text(L10n.of(context).username),
              ),
              PopupMenuItem(
                value: 'created_at',
                child: Text(L10n.of(context).date_subscribed),
              ),
            ],
            onSelected: (value) => context.read<SubscriptionsModel>().changeOrderSubscriptionsBy(value),
          ),
          IconButton(
            icon: const Icon(Symbols.sort_by_alpha_rounded),
            onPressed: () async {
              await context.read<SubscriptionsModel>().toggleOrderSubscriptionsAscending();
            },
          ),
          ...createCommonAppBarActions(context)
        ],
      ),
      body: const SubscriptionUsers(),
    );
  }
}
