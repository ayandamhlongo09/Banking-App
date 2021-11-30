import 'package:banking_app/services/repositories/home/home_repository.dart';
import 'package:flutter/material.dart';
import 'base_viewmodel.dart';

class HomeViewModel extends ChangeNotifier implements BaseViewModel {
  final HomeRepository _repository;



  HomeViewModel({
    @required HomeRepository repository,
  }) : _repository = repository;


  @override
  void reset() {
    notifyListeners();
  }
}
