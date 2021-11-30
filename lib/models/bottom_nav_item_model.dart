import 'package:flutter/widgets.dart';

class BottomNavItem {
  /// Title Text for navigation item if title widget is not available
  final String label;

  /// Icon for this navigation item
  final IconData iconData;

  /// Icon for this navigation item when active
  final IconData activeIconData;

  /// Route for this navigation item
  final String route;

  BottomNavItem({
    @required this.label,
    @required this.iconData,
    @required this.activeIconData,
    @required this.route,
  });
}
