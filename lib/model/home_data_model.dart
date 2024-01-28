import 'package:untitled/model/drink_model.dart';
import 'package:untitled/screens/home/controller/home_controller.dart';

class HomeDataModel {
  SortItem sort;
  List<DrinkModel> listNewData;
  HomeDataModel({required this.sort, required this.listNewData});

  HomeDataModel copyWith({
    SortItem? sort,
    List<DrinkModel>? listNewData,
  }) =>
      HomeDataModel(
          sort: sort ?? this.sort,
          listNewData: listNewData ?? this.listNewData);
}
