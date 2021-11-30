import 'package:banking_app/models/bottom_nav_item_model.dart';
import 'package:banking_app/services/repositories/bottom_nav/bottom_nav_repository.dart';
import 'package:flutter/material.dart';
import 'base_viewmodel.dart';

class BottomNavViewModel extends ChangeNotifier implements BaseViewModel {
  final BottomNavRepository _repository;

  List<BottomNavItem> _bottomNavItems = <BottomNavItem>[];

  BottomNavViewModel({
    @required BottomNavRepository repository,
  }) : _repository = repository {
    getBottomNavItems();
  }

  List<void> getBottomNavItems() {
    return _bottomNavItems = _repository.listBottomNavItems();
  }

  List<BottomNavItem> get bottomNavItems => _bottomNavItems;
  @override
  void reset() {
    notifyListeners();
  }
}
