import 'dart:async';

import 'package:untitled/model/drink_model.dart';
import 'package:untitled/model/option_model.dart';

abstract class CartController {
  List<DrinkModel> get listDrink;

  List<OptionModel> get listSize;
  List<OptionModel> get listOption;
  List<OptionModel> get listTopping;
  DrinkModel? get dataCart;

  Stream<int> get moneyStream;
  Stream<int> get countStream;
  Stream<int> get selectIndexSizeStream;
  Stream<int> get selectIndexToppingStream;
  Stream<int> get selectIndexOptionStream;

  void initData(int drink);
  void onClose();
  void addSizePrice(int index);
  void addTopicPrice(int index);
  void addOptionPrice(int index);
  void onPressRemoveTotal();
  // void updatePrice();
  void onPressAddTotal();
}
