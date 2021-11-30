import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'init_app/init_app.dart';

void main() async {
  // load static app settings
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromAsset("app_settings");

  // initialise app
  initApp();
}