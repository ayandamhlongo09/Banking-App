import 'package:banking_app/constants/app_colors.dart';
import 'package:banking_app/models/bottom_nav_item_model.dart';
import 'package:banking_app/pages/deposit.dart';
import 'package:banking_app/pages/home.dart';
import 'package:banking_app/pages/open_account.dart';
import 'package:banking_app/pages/withdraw.dart';
import 'package:banking_app/viewmodels/bottom_nav_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:banking_app/viewmodels/user_viewmodel.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final UserViewModel userViewModel =
        Provider.of<UserViewModel>(context, listen: false);

    return Consumer<BottomNavViewModel>(
      builder:
          (BuildContext ctx, BottomNavViewModel navBarViewModel, Widget _) {
        final List<BottomNavItem> bottomNavItems =
            navBarViewModel.bottomNavItems;
        final List<BottomNavigationBarItem> _bottomNavigationBarItemList =
            bottomNavItems
                .map(
                  (BottomNavItem item) => BottomNavigationBarItem(
                    label: item.label,
                    icon: Icon(item.iconData),
                    activeIcon: Icon(item.activeIconData),
                  ),
                )
                .toList();

        final List<Widget> _pageList = [
          HomePage(),
          DepositPage(),
          WithdrawPage(),
          OpenAccountPage(),
        ];

        return Scaffold(
          backgroundColor: AppColors.light,
          body: _pageList[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: _bottomNavigationBarItemList,
            onTap: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
          ),
        );
      },
    );
  }
}
