import 'package:banking_app/constants/app_icons.dart';
import 'package:banking_app/models/bottom_nav_item_model.dart';
import 'package:banking_app/utils/routes.dart';
import '../bottom_nav_repository.dart';

class BottomNavRepositoryImpl implements BottomNavRepository {

   
  static List<BottomNavItem> _bottomBottomNavItems = <BottomNavItem>[
    BottomNavItem(
      label: "Home",
      iconData: AppIcons.home,
      activeIconData: AppIcons.home,
      route: AppRoutes.home,
    ),
    BottomNavItem(
      label: "Deposit",
      iconData: AppIcons.deposit,
      activeIconData: AppIcons.deposit,
      route: AppRoutes.deposit,
    ),
    BottomNavItem(
      label: "Withdraw",
      iconData: AppIcons.withdraw,
      activeIconData: AppIcons.withdraw,
      route: AppRoutes.withdraw,
    ),
    BottomNavItem(
      label: "New Account",
      iconData: AppIcons.open_account,
      activeIconData: AppIcons.open_account,
      route: AppRoutes.open_account,
    ),
  ];

  @override
  List<BottomNavItem> listBottomNavItems() {
    return _bottomBottomNavItems;
  }
}
