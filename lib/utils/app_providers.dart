import 'package:banking_app/services/repositories/bottom_nav/bottom_nav_repository.dart';
import 'package:banking_app/services/repositories/home/home_repository.dart';
import 'package:banking_app/services/repositories/user/user_repository.dart';
import 'package:banking_app/utils/service_locator.dart';
import 'package:banking_app/viewmodels/bottom_nav_viewmodel.dart';
import 'package:banking_app/viewmodels/home_viewmodel.dart';
import 'package:banking_app/viewmodels/user_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> appProviders = [
  ...viewModelProviders,
];

List<SingleChildWidget> viewModelProviders = [
  ChangeNotifierProvider(
    create: (context) => UserViewModel(
      repository: serviceLocator<UserRepository>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) => BottomNavViewModel(
      repository: serviceLocator<BottomNavRepository>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) => HomeViewModel(
      repository: serviceLocator<HomeRepository>(),
    ),
  ),
];
