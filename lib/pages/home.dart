import 'package:banking_app/components/alert_dialog.dart';
import 'package:banking_app/components/expansion_card.dart';
import 'package:banking_app/constants/app_colors.dart';
import 'package:banking_app/constants/app_icons.dart';
import 'package:banking_app/helpers/validators.dart';
import 'package:banking_app/viewmodels/home_viewmodel.dart';
import 'package:banking_app/viewmodels/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:provider/provider.dart';
import 'package:banking_app/components/form_field_entry.dart';

enum updateClientFormField { newName, newAge, newAccounts }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isExpanded = true;
  final _formKey = GlobalKey<FormState>();
  final Map<updateClientFormField, String> _updatedinfo = {
    updateClientFormField.newName: null,
    updateClientFormField.newAge: null,
    updateClientFormField.newAccounts: null
  };

  @override
  Widget build(BuildContext context) {
    final UserViewModel userViewModel =
        Provider.of<UserViewModel>(context, listen: false);

    return Consumer<HomeViewModel>(
        builder: (BuildContext ctx, HomeViewModel homeNavViewModel, Widget _) {
      return Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          leadingWidth: MediaQuery.of(context).size.width * 0.27,
          leading: Row(
            children: [],
          ),
          title: Text(
            GlobalConfiguration().getValue<String>('appTitle'),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ExpansionCard(
                    selectedState: isExpanded,
                    trailing: isExpanded ? "+" : "-",
                    leading: userViewModel.user.name.isEmpty
                        ? "No Name Found!"
                        : userViewModel.user.name +
                            " (" +
                            userViewModel.user.age.toString() +
                            "yrs)",
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16),
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Accounts"),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: userViewModel.user.accounts.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    child: TextButton(
                                      style: ElevatedButton.styleFrom(
                                        onPrimary: AppColors.primary,
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(0.0),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Row(
                                        children: [
                                          Icon(
                                            AppIcons.circle,
                                            size: 5.0,
                                            color: AppColors.primary,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            userViewModel.user.accounts[index]
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ],
                    onExpansionChanged: ((newState) {
                      if (newState)
                        setState(() {
                          isExpanded = newState;
                        });
                      else
                        setState(() {
                          isExpanded = !newState;
                        });
                    }),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.09,
                    child: TextButton.icon(
                      onPressed: () {
                        CustomAlertDialog.okAndCancelDialog(
                            context: context,
                            title: "Update client details",
                            content: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  FormFieldEntry(
                                    title: 'Client Name',
                                    keyboardType: TextInputType.name,
                                    onChanged: (value) {
                                      _updatedinfo[
                                              updateClientFormField.newName] =
                                          value.toString().toLowerCase().trim();
                                    },
                                    onSaved: (value) {
                                      _updatedinfo[
                                              updateClientFormField.newName] =
                                          value.toString().toLowerCase().trim();
                                    },
                                    hintText: 'Enter updated Name',
                                    validator: validateString,
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  FormFieldEntry(
                                    title: 'age',
                                    onChanged: (value) {
                                      _updatedinfo[
                                          updateClientFormField.newAge] = value;
                                    },
                                    onSaved: (value) {
                                      _updatedinfo[
                                          updateClientFormField.newAge] = value;
                                    },
                                    hintText: 'Enter updated age',
                                    validator: validateString,
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          userViewModel.user.accounts.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          child: TextButton(
                                            style: ElevatedButton.styleFrom(
                                              onPrimary: AppColors.primary,
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        0.0),
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: Row(
                                              children: [
                                                Icon(
                                                  AppIcons.circle,
                                                  size: 5.0,
                                                  color: AppColors.primary,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  userViewModel
                                                      .user.accounts[index]
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 18),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      })
                                ],
                              ),
                            ));
                      },
                      label: Text(
                        "Update details",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                            fontWeight: FontWeight.bold),
                      ),
                      icon: Icon(Icons.ac_unit_outlined),
                      style: TextButton.styleFrom(
                        primary: AppColors.primary,
                        backgroundColor: AppColors.light,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.13,
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextButton.icon(
                onPressed: () {},
                label: Text(
                  "SELL",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                icon: Icon(Icons.ac_unit_outlined),
                style: TextButton.styleFrom(
                  primary: AppColors.primary,
                  backgroundColor: AppColors.light,
                ),
              )),
        ),
      );
    });
  }
}
