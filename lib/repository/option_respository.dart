import 'package:untitled/model/option_model.dart';

class OptionRepository {
  static final OptionRepository _instance = OptionRepository._internal();

  factory OptionRepository() {
    return _instance;
  }

  OptionRepository._internal();

  List<OptionModel> listOption = [
    OptionModel(id: 1, name: "Không đường", price: 0),
    OptionModel(id: 2, name: "Ít đường", price: 0),
    OptionModel(id: 3, name: "Nhiều đường", price: 0),
    OptionModel(id: 4, name: "Không đá", price: 0),
    OptionModel(id: 5, name: "Ít đá", price: 0),
    OptionModel(id: 6, name: "Nhiều đá", price: 0),
  ];
}
