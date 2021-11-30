import 'package:banking_app/utils/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'app.dart';

void initApp() {
  registerServices();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(RunApp(
  ));
}
