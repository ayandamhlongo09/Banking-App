import 'package:banking_app/components/expansion_card.dart';
import 'package:banking_app/constants/app_colors.dart';
import 'package:banking_app/viewmodels/home_viewmodel.dart';
import 'package:banking_app/viewmodels/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // User user;
  bool isExpanded = true;

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
                        : userViewModel.user.name,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16),
                        alignment: Alignment.topLeft,
                        height: MediaQuery.of(context).size.height * 0.13,
                        child: Column(
                          children: [Text("hello")],
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
              )
              // (
              //   child: Text(
              //     "SELL",
              //     style:
              //         TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //   ),
              //   onPressed: () {},
              //   style: TextButton.styleFrom(
              //     primary: AppColors.primary,
              //     backgroundColor: AppColors.white,
              //   ),
              // ),
              ),
        ),
      );
    });
  }
}
