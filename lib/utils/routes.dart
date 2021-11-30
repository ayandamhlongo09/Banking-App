import 'package:banking_app/components/bottom_nav_bar.dart';
import 'package:banking_app/pages/deposit.dart';
import 'package:banking_app/pages/home.dart';
import 'package:banking_app/pages/login.dart';
import 'package:banking_app/pages/open_account.dart';
import 'package:banking_app/pages/splash.dart';
import 'package:banking_app/pages/withdraw.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String deposit = '/deposit';
  static const String withdraw = '/withdraw';
  static const String open_account = '/open_account';
  static const String bottom_nav_bar = '/bottom_nav_bar';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (BuildContext context) => SplashPage(),
          settings: settings,
        );

      case login:
        return MaterialPageRoute(
          builder: (BuildContext context) => LoginPage(),
          settings: settings,
        );
      case home:
        return MaterialPageRoute(
          builder: (BuildContext context) => HomePage(),
          settings: settings,
        );
      case deposit:
        return MaterialPageRoute(
          builder: (BuildContext context) => DepositPage(),
          settings: settings,
        );
      case withdraw:
        return MaterialPageRoute(
          builder: (BuildContext context) => WithdrawPage(),
          settings: settings,
        );
      case open_account:
        return MaterialPageRoute(
          builder: (BuildContext context) => OpenAccountPage(),
          settings: settings,
        );
      case bottom_nav_bar:
        return MaterialPageRoute(
          builder: (BuildContext context) => BottomNavBar(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => SplashPage(),
          settings: settings,
        );
    }
  }
}
