import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled/model/drink_model.dart';
import 'package:untitled/model/home_data_model.dart';
import 'package:untitled/repository/drink_respository.dart';
import 'package:untitled/screens/home/controller/home_controller.dart';

class HomeControllerImpl extends HomeController {
  int count = 0;

  @override
  List<DrinkModel> listDrink = DrinkRepository().listDrink;

  final StreamController<int> _countStreamController =
      StreamController<int>.broadcast();

  Stream<int> get _countStream => _countStreamController.stream;
  @override
  Stream<int> get countStream => _countStream;

  final StreamController<HomeDataModel> _saveStreamController =
      StreamController<HomeDataModel>.broadcast();

  Stream<HomeDataModel> get _saveStream => _saveStreamController.stream;

  @override
  Stream<HomeDataModel> get saveStream => _saveStream;

  HomeDataModel? _lastVaule;
  @override
  HomeDataModel get initialValue =>
      HomeDataModel(sort: SortItem.popular, listNewData: listDrink);

  @override
  void onPressAddCount(BuildContext context) {
    count++;
    _countStreamController.add(count);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Đã thêm thành công")));
  }

  @override
  void onPressSave(int index) {
    if (_lastVaule == null) {
      return;
    }
    if (_lastVaule!.listNewData[index].save == null) {
      return;
    }
    _lastVaule!.listNewData[index].save = !_lastVaule!.listNewData[index].save!;
    _saveStreamController.add(_lastVaule!);
  }

  @override
  void onPressSortData(SortItem vaule) {
    if (vaule == SortItem.bestSeller) {
      listDrink.sort((a, b) => b.rating!.compareTo(a.rating!));
      _saveStreamController
          .add(HomeDataModel(sort: vaule, listNewData: listDrink));
    } else if (vaule == SortItem.cheap) {
      // dropdownValue = vaule;
      listDrink.sort((a, b) => a.salePrice!.compareTo(b.salePrice!));
      _saveStreamController
          .add(HomeDataModel(sort: vaule, listNewData: listDrink));
    } else if (vaule == SortItem.popular) {
      // dropdownValue = vaule;
      listDrink.sort((a, b) => b.favorite!.compareTo(a.favorite!));
      _saveStreamController
          .add(HomeDataModel(sort: vaule, listNewData: listDrink));
    }
  }

  @override
  void initData() {
    _saveStreamController
        .add(HomeDataModel(listNewData: listDrink, sort: SortItem.popular));
    _lastVaule = HomeDataModel(sort: SortItem.popular, listNewData: listDrink);
    _saveStream.listen((vaule) {
      _lastVaule = vaule;
    });
  }

  @override
  void onClose() {
    _countStreamController.close();
    _saveStreamController.close();
  }
}
