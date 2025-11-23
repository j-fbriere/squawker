import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:logging/logging.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pref/pref.dart';
import 'package:squawker/client/client_account.dart';
import 'package:squawker/client/login_webview.dart';
import 'package:squawker/client/client_x_regular_account.dart';
import 'package:squawker/constants.dart';
import 'package:squawker/database/entities.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:squawker/utils/notifiers.dart';
import 'package:provider/provider.dart';

class SettingsAccountFragment extends StatefulWidget {

  const SettingsAccountFragment({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsAccountFragmentState();
}

class _SettingsAccountFragmentState extends State<SettingsAccountFragment> {
  static final log = Logger('_SettingsAccountFragmentState');

  final RegExp _expId = RegExp(r'guest_id=(.+?);');

  //late List<TwitterTokenEntity> _regularAccountsTokens;
  late List<Account> _xAccountLst ;
  AccountAddedNotifier? _accountAddedNotifier;

  @override
  void initState() {
    super.initState();
    //_regularAccountsTokens = TwitterAccount.getRegularAccountsTokens();
    _xAccountLst = TwitterAccount.xAccountLst ?? [];
    print('*** SettingsAccountFragment.initState _xAccountLst.length=${_xAccountLst.length}');
  }

  @override
  Widget build(BuildContext context) {
    TwitterAccount.setCurrentContext(context);
    BasePrefService prefs = PrefService.of(context);
    int nbrGuestAccounts = TwitterAccount.nbrGuestAccounts();
    List<Map<String,String>> accountTypeLst = [
      {'id': twitterAccountTypesPriorityToRegular, 'val': L10n.of(context).twitter_account_types_priority_to_regular},
      {'id': twitterAccountTypesBoth, 'val': L10n.of(context).twitter_account_types_both},
      {'id': twitterAccountTypesOnlyRegular, 'val': L10n.of(context).twitter_account_types_only_regular}
    ];
    List<Widget> guestAccountLst = [];
    if (nbrGuestAccounts > 0) {
      guestAccountLst.add(PrefDropdown(
        fullWidth: false,
        title: Text(L10n.of(context).twitter_account_types_label),
        subtitle: Text(L10n.of(context).twitter_account_types_description),
        pref: optionTwitterAccountTypes,
        items: accountTypeLst
          .map((e) => DropdownMenuItem(value: e['id'], child: Text(e['val'] as String)))
          .toList(),
        onChange: (value) async {
          await TwitterAccount.flushLastTwitterOauthToken();
          if (value ==  twitterAccountTypesBoth || value ==  twitterAccountTypesPriorityToRegular) {
            TwitterAccount.currentAccountTypes = value as String;
            TwitterAccount.sortAccounts();
          }
        },
      ));
      if (prefs.get(optionTwitterAccountTypes) != twitterAccountTypesOnlyRegular) {
        guestAccountLst.add(PrefLabel(
          title: Text(L10n.of(context).nbr_guest_accounts(nbrGuestAccounts))
        ));
      }
    }
    return Scaffold(
      appBar: AppBar(title: Text(L10n.current.account)),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView(
          children: [
            ...guestAccountLst,
            PrefButton(
              title: Text(L10n.current.regular_accounts(_xAccountLst.length)),
              child: Icon(Symbols.add),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const TwitterLoginWebview()));
                if (_accountAddedNotifier == null) {
                  _accountAddedNotifier = Provider.of<AccountAddedNotifier>(context, listen: false);
                  _accountAddedNotifier!.addListener(() async {
                    _xAccountLst = await TwitterAccount.initCheckXAccounts(forceInit: true);
                    setState(() {
                    });
                  });
                }
                /*
                if (result != null && result) {
                  setState(() {
                    _regularAccountsTokens = TwitterAccount.getRegularAccountsTokens();
                  });
                }
                */
              },
            ),
            ListView.builder(
              itemCount: _xAccountLst.length,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                /*
                List<String> infoLst = [];
                if (_regularAccountsTokens[index].profile!.name?.isNotEmpty ?? false) {
                  infoLst.add(_regularAccountsTokens[index].profile!.name!);
                }
                if (_regularAccountsTokens[index].profile!.email?.isNotEmpty ?? false) {
                  infoLst.add(_regularAccountsTokens[index].profile!.email!);
                }
                if (_regularAccountsTokens[index].profile!.phone?.isNotEmpty ?? false) {
                  infoLst.add(_regularAccountsTokens[index].profile!.phone!);
                }
                */
                RegExpMatch? matchId = _expId.firstMatch(_xAccountLst[index].authHeader);
                String? guestId = matchId?.group(1);
                return SwipeActionCell(
                  //key: Key(_regularAccountsTokens[index].oauthToken),
                  key: Key(_xAccountLst[index].id),
                  trailingActions: <SwipeAction>[
                    SwipeAction(
                      title: L10n.current.delete,
                      onTap: (CompletionHandler handler) async {
                        //await TwitterAccount.deleteTwitterToken(_regularAccountsTokens[index]);
                        await XRegularAccount.deleteAccount(_xAccountLst[index].id);
                        _xAccountLst = await TwitterAccount.initCheckXAccounts(forceInit: true);
                        setState(() {
                          //_regularAccountsTokens.removeAt(index);
                        });
                      },
                      color: Colors.red
                    ),
                  ],
                  child: Card(
                    child: ListTile(
                      leading: const Icon(Symbols.person),
                      title: Text(guestId ?? '???'),
                      //subtitle: infoLst.isEmpty ? null : Text(infoLst.join(', ')),
                      /*
                      trailing: IconButton(
                        icon: const Icon(Symbols.edit),
                        onPressed: () async {
                          var result = await showDialog<bool>(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: AddAccountDialog(accountToEdit: _regularAccountsTokens[index].screenName),
                              );
                            }
                          );
                          if (result != null && result) {
                            setState(() {
                              _regularAccountsTokens = TwitterAccount.getRegularAccountsTokens();
                            });
                          }
                        },
                      ),
                      */
                    )
                  ),
                );
              }
            ),
          ]
        )
      )
    );
  }
}

class AddAccountDialog extends StatefulWidget {
  @override
  State<AddAccountDialog> createState() => _AddAccountDialogState();
  String? accountToEdit;

  AddAccountDialog({Key? key, this.accountToEdit}): super(key: key);
}

class _AddAccountDialogState extends State<AddAccountDialog> {

  bool _passwordObscured = true;
  bool _saveEnabled = false;
  String _username = '';
  String _password = '';
  String? _name;
  String? _email;
  String? _phone;
  TextEditingController? _usernameController;
  TextEditingController? _passwordController;
  TextEditingController? _nameController;
  TextEditingController? _emailController;
  TextEditingController? _phoneController;

  @override
  void initState() {
    super.initState();
    if (widget.accountToEdit != null) {
      _saveEnabled = true;
      _username = widget.accountToEdit!;
      _usernameController = TextEditingController(text: widget.accountToEdit!);
      TwitterProfileEntity? tpe = TwitterAccount.getProfile(widget.accountToEdit!);
      if (tpe != null) {
        _password = tpe.password;
        _passwordController = TextEditingController(text: tpe.password);
        if (tpe.name?.isNotEmpty ?? false) {
          _name = tpe.name;
          _nameController = TextEditingController(text: tpe.name);
        }
        if (tpe.email?.isNotEmpty ?? false) {
          _email = tpe.email;
          _emailController = TextEditingController(text: tpe.email);
        }
        if (tpe.phone?.isNotEmpty ?? false) {
          _phone = tpe.phone;
          _phoneController = TextEditingController(text: tpe.phone);
        }
      }
    }
  }

  void _checkEnabledSave() {
    if (_username.isEmpty || _password.isEmpty) {
      if (_saveEnabled) {
        setState(() {
          _saveEnabled = false;
        });
      }
    }
    else {
      if (!_saveEnabled) {
        setState(() {
          _saveEnabled = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    TwitterAccount.setCurrentContext(context);
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        //physics: NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(widget.accountToEdit != null ? L10n.current.edit_account_title : L10n.current.add_account_title, style: TextStyle(fontSize: 20))
            ),
            SizedBox(height: 60),
            Text(L10n.current.mandatory_label),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: width / 4,
                  child: Text(L10n.current.username_label),
                ),
                Expanded(
                  child: TextField(
                    readOnly: widget.accountToEdit != null ? true : false,
                    controller: _usernameController,
                    decoration: InputDecoration(contentPadding: EdgeInsets.all(5)),
                    onChanged: (text) {
                      _username = text.trim();
                      _checkEnabledSave();
                    },
                  ),
                )
              ]
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: width / 4,
                  child: Text(L10n.current.password_label),
                ),
                Expanded(
                  child: TextField(
                    controller: _passwordController,
                    obscureText: _passwordObscured,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      suffixIcon: IconButton(
                        icon: Icon(_passwordObscured
                          ? Symbols.visibility_off
                          : Symbols.visibility
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordObscured = !_passwordObscured;
                          });
                        },
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (text) {
                      _password = text.trim();
                      _checkEnabledSave();
                    },
                  ),
                )
              ]
            ),
            SizedBox(height: 20),
            Text(L10n.current.optional_label),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: width / 4,
                  child: Text(L10n.current.name_label),
                ),
                Expanded(
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(contentPadding: EdgeInsets.all(5)),
                    onChanged: (text) {
                      _name = text.trim();
                    },
                  ),
                ),
              ]
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: width / 4,
                  child: Text(L10n.current.email_label),
                ),
                Expanded(
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(contentPadding: EdgeInsets.all(5)),
                    onChanged: (text) {
                      _email = text.trim();
                    },
                  ),
                ),
              ]
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: width / 4,
                  child: Text(L10n.current.phone_label),
                ),
                Expanded(
                  child: TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(contentPadding: EdgeInsets.all(5)),
                    onChanged: (text) {
                      _phone = text.trim();
                    },
                  ),
                ),
              ]
            ),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text(L10n.current.cancel),
                  onPressed: () => Navigator.pop(context, false),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  child: Text(L10n.current.save, style: TextStyle(color: _saveEnabled ? Theme.of(context).textTheme.labelMedium!.color: Theme.of(context).disabledColor)),
                  onPressed: () async {
                    if (!_saveEnabled) {
                      return;
                    }
                    try {
                      // this creates a new authenticated token and delete the old one if applicable
                      await TwitterAccount.createRegularTwitterToken(_username, _password, _name, _email, _phone);
                      Navigator.pop(context, true);
                    }
                    catch (e, _) {
                      await showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(L10n.current.error_from_twitter),
                            content: Text(e.toString()),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(L10n.current.ok),
                              ),
                            ]
                          );
                        }
                      );
                      Navigator.pop(context, false);
                    }
                  }
                ),
              ]
            )
          ]
        )
      )
    );
  }
}
