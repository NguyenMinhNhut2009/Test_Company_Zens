import 'package:untitled/model/option_model.dart';

class ToppingRepository {
  static final ToppingRepository _instance = ToppingRepository._internal();

  factory ToppingRepository() {
    return _instance;
  }

  ToppingRepository._internal();

  List<OptionModel> listTopping = [
    OptionModel(id: 1, name: "Bánh quy", price: 5000),
    OptionModel(id: 2, name: "Bánh bông lan trứng muối", price: 15000),
    OptionModel(id: 3, name: "Bơ sữa", price: 15000),
    OptionModel(id: 4, name: "Thạch rau câu", price: 5000),
  ];
}
