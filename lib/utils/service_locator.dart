import 'package:banking_app/services/core/connectivity/connectivity.dart';
import 'package:banking_app/services/core/connectivity/implementation/connectivity_impl.dart';
import 'package:banking_app/services/datasources/user/implementation/user_data_source_impl.dart';
import 'package:banking_app/services/datasources/user/user_data_source.dart';
import 'package:banking_app/services/repositories/bottom_nav/bottom_nav_repository.dart';
import 'package:banking_app/services/repositories/bottom_nav/implementation/bottom_nav_repository_impl.dart';
import 'package:banking_app/services/repositories/home/home_repository.dart';
import 'package:banking_app/services/repositories/home/implementation/home_repository_impl.dart';
import 'package:banking_app/services/repositories/user/implementation/user_repository_impl.dart';
import 'package:banking_app/services/repositories/user/user_repository.dart';
import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.instance;

void registerServices() {
// CREATE INSTANCES

//independent services

  final ConnectivityInfo connectivityInfo = ConnectivityInfoImpl();

  // datasources

  final UserDataSource userDataSource = UserDataSourceImpl();

  //repositories

  final BottomNavRepository bottomNavRepository = BottomNavRepositoryImpl();
  final HomeRepository homeRepository = HomeRepositoryImpl();
  final UserRepository userRepository = UserRepositoryImpl(
      userDataSource: userDataSource, connectivityInfo: connectivityInfo);

  // START REGISTRATION

  // datasources
  serviceLocator.registerSingleton<UserDataSource>(userDataSource);
  // repositories

  serviceLocator.registerSingleton<BottomNavRepository>(bottomNavRepository);
  serviceLocator.registerSingleton<HomeRepository>(homeRepository);
  serviceLocator.registerSingleton<UserRepository>(userRepository);
}
