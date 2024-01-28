import 'dart:async';

import 'package:untitled/model/drink_model.dart';
import 'package:untitled/model/option_model.dart';
import 'package:untitled/screens/cart/controller/cart_controller.dart';

class CartControllerIml extends CartController {
  int total = 1;
  int price = 0;
  int priceSize = 0;
  int priceUpdate = 0;
  int priceTopping = 0;
  int priceOption = 0;
  OptionModel? selectSize;
  int? selectIndexSize;
  OptionModel? selectTopping;
  int? selectIndexTopping;
  OptionModel? selectOption;
  int? selectIndexOption;

  @override
  List<DrinkModel> listDrink = DrinkRepository().listDrink;

  @override
  List<OptionModel> listSize = OptionRepository().listSize;

  @override
  List<OptionModel> listOption = OptionRepository().listOption;

  @override
  List<OptionModel> listTopping = OptionRepository().listTopping;
  int? initialSelectedIndex;
  @override
  DrinkModel? dataCart;

  final StreamController<int> _countStreamController =
      StreamController<int>.broadcast();

  Stream<int> get _countStream => _countStreamController.stream;
  @override
  Stream<int> get countStream => _countStream;

  final StreamController<int> _moneyStreamController =
      StreamController<int>.broadcast();
  Stream<int> get _moneyStream => _moneyStreamController.stream;
  @override
  Stream<int> get moneyStream => _moneyStream;

  final StreamController<int> _selectIndexSizeStreamController =
      StreamController<int>.broadcast();
  Stream<int> get _selectIndexSizeStream =>
      _selectIndexSizeStreamController.stream;
  @override
  Stream<int> get selectIndexSizeStream => _selectIndexSizeStream;

  final StreamController<int> _selectIndexToppingController =
      StreamController<int>.broadcast();
  Stream<int> get _selectIndexToppingStream =>
      _selectIndexToppingController.stream;
  @override
  Stream<int> get selectIndexToppingStream => _selectIndexToppingStream;

  final StreamController<int> _selectIndexOptionController =
      StreamController<int>.broadcast();
  Stream<int> get _selectIndexOptionStream =>
      _selectIndexOptionController.stream;

  @override
  Stream<int> get selectIndexOptionStream => _selectIndexOptionStream;

  @override
  void onPressAddTotal() {
    total++;
    price = total * dataCart!.price!;
    updatePrice();
    _countStreamController.add(total);
  }

  @override
  void onPressRemoveTotal() {
    total--;
    price = total * dataCart!.price!;
    updatePrice();
    _countStreamController.add(total);
  }

  // @override
  void updatePrice() {
    priceUpdate = price +
        (priceSize * total) +
        (priceTopping * total) +
        (priceOption * total);
    _moneyStreamController.add(priceUpdate);
  }

  @override
  void addTopicPrice(int index) {
    _selectIndexToppingController.add(index);
    priceTopping = listTopping[index].price!.toInt();
    updatePrice();
  }

  @override
  void addSizePrice(int index) {
    _selectIndexSizeStreamController.add(index);
    priceSize = listSize[index].price!.toInt();
    updatePrice();
  }

  @override
  void addOptionPrice(int index) {
    _selectIndexOptionController.add(index);
    priceOption = listOption[index].price!.toInt();
    updatePrice();
  }

  @override
  void initData(int drink) {
    dataCart = listDrink.firstWhere((e) => e.id == drink);
    price = dataCart!.price!;
  }

  @override
  void onClose() {
    _moneyStreamController.close();
    _selectIndexOptionController.close();
    _selectIndexSizeStreamController.close();
    _selectIndexToppingController.close();
  }
}
