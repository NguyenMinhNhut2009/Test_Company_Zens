import 'package:flutter/material.dart';
import 'package:untitled/model/drink_model.dart';
import 'package:untitled/model/home_data_model.dart';

abstract class HomeController {
  List<DrinkModel> get listDrink;
  Stream<int> get countStream;
  Stream<HomeDataModel> get saveStream;

  HomeDataModel get initialValue;

  void onPressAddCount(BuildContext context);
  void onPressSave(int index);
  void onPressSortData(SortItem vaule);
  void onClose();
  void initData();
}

enum SortItem {
  popular,
  bestSeller,
  cheap;

  String getDisplayName() {
    switch (this) {
      case popular:
        return "Phổ biến";
      case bestSeller:
        return "Mua nhiều";
      case cheap:
        return "Giá rẻ";
    }
  }
}
