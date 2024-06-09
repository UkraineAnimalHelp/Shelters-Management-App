import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:uah_shelters/src/constants/constants.dart';
import 'package:uah_shelters/src/repository/org_repository.dart';
import 'package:provider/provider.dart';
import 'package:uah_shelters/src/models/employee.dart';
import 'package:uah_shelters/src/models/account.dart';
import 'package:uah_shelters/src/providers/auth_provider.dart';
import 'package:uah_shelters/src/utils/string.dart';

@RoutePage()
class RegisterOrganizationScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();

  RegisterOrganizationScreen({super.key});

  Future<String?> validate(BuildContext context, String? val) async {
    var msg = 'Orgnanization name should be at least 3 symbols long';
    if (val!.trim().length < 3) {
      return msg;
    }

    final repo = OrgRepository.instance;
    var accountUUID = makeURI(val);

    Account? account = await repo.getOneAccount(accountUUID);
    if (account != null) {
      return "Such organization already exists";
    }

    return null;
  }

  void submit(BuildContext context) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final repo = OrgRepository.instance;
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);

    if (_formKey.currentState!.validate()) {
      var userID = authProvider.user!.id!;
      Employee? employee = await repo.getOneEmployee(userID);
      
      var accountUUID = makeURI(_textEditingController.text);
      Account? account = await repo.getOneAccount(accountUUID);
      if (account != null) {
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content:
                Text('Such organization already exists. Choose another one'),
            duration: Duration(seconds: 10),
          ),
        );
        return;
      }

      account = Account(
          organizationName: _textEditingController.text,
          ownerUUID: userID,
          uuid: accountUUID);

      try {
        await repo.addAccount(account);
      } catch (e) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Failed to create new organization: $e'),
            duration: const Duration(seconds: 10),
          ),
        );
        return;
      }

      employee!.accountUUID = accountUUID;
      employee.isOwner = true;
      await repo.updateEmployee(employee);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseStyle.backgroundColor,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.05),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 700.0, // Set the maximum width here
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const Text(
                      'Create organization',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: BaseStyle.primaryTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 48.0),
                    TextFormField(
                      key: const Key("orgName"),
                      controller: _textEditingController,
                      validator: (value) => value!.trim().length >= 3
                          ? null
                          : 'Orgnanization name should be at least 3 symbols long',
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your organization name',
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            BaseStyle.primaryButtonColor, // Background color
                        foregroundColor:
                            BaseStyle.primaryButtonTextColor, // Text color
                      ),
                      onPressed: () async {
                        submit(context);
                        AutoRouter.of(context).replaceAll([
                          const HomeRoute(),
                        ]);
                      },
                      child: const Text('Create new one'),
                    ),
                    const SizedBox(height: 24.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
