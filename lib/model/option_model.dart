class OptionModel {
  int? id;
  String? name;
  int? price;

  OptionModel({this.id, this.name, this.price});
}

class OptionRepository {
  static final OptionRepository _instance = OptionRepository._internal();

  factory OptionRepository() {
    return _instance;
  }

  OptionRepository._internal();

  List<OptionModel> listTopping = [
    OptionModel(id: 1, name: "Bánh quy", price: 5000),
    OptionModel(id: 2, name: "Bánh bông lan trứng muối", price: 15000),
    OptionModel(id: 3, name: "Bơ sữa", price: 15000),
    OptionModel(id: 4, name: "Thạch rau câu", price: 5000),
  ];
  List<OptionModel> listSize = [
    OptionModel(id: 1, name: "S", price: 0),
    OptionModel(id: 2, name: "M", price: 5000),
    OptionModel(id: 3, name: "L", price: 10000)
  ];
  List<OptionModel> listOption = [
    OptionModel(id: 1, name: "Không đường", price: 0),
    OptionModel(id: 2, name: "Ít đường", price: 0),
    OptionModel(id: 3, name: "Nhiều đường", price: 0),
    OptionModel(id: 4, name: "Không đá", price: 0),
    OptionModel(id: 5, name: "Ít đá", price: 0),
    OptionModel(id: 6, name: "Nhiều đá", price: 0),
  ];
}
