import 'package:untitled/model/option_model.dart';

class SizeRepository {
  static final SizeRepository _instance = SizeRepository._internal();

  factory SizeRepository() {
    return _instance;
  }

  SizeRepository._internal();

  List<OptionModel> listSize = [
    OptionModel(id: 1, name: "S", price: 0),
    OptionModel(id: 2, name: "M", price: 5000),
    OptionModel(id: 3, name: "L", price: 10000)
  ];
}
