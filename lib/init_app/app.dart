import 'package:banking_app/constants/app_colors.dart';
import 'package:banking_app/utils/app_providers.dart';
import 'package:banking_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:provider/provider.dart';

class RunApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));

    SystemChannels.textInput.invokeMethod('TextInput.hide'); //hides keyboard

    return MultiProvider(
      providers: appProviders,
      child: AirtimeTopUpApp(),
    );
  }
}

class AirtimeTopUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String appTitle = GlobalConfiguration().getValue<String>('appTitle');

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: AppColors.primary,
      ),
      title: appTitle,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
