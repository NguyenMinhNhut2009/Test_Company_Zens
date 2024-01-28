import 'package:untitled/model/drink_model.dart';

class DrinkRepository {
  static final DrinkRepository _instance = DrinkRepository._internal();

  factory DrinkRepository() {
    return _instance;
  }

  DrinkRepository._internal();

  List<DrinkModel> listDrink = [
    DrinkModel(
      id: 1,
      name: "Trà Đào mix Dứa",
      img: "assets/images/img_prod_1.png",
      description: "Đào, chanh Quảng Đông, đường cát, hương dứa tự nhiên.",
      price: 30000,
      salePrice: 25000,
      favorite: 1500,
      rating: 4.2,
      save: false,
    ),
    DrinkModel(
      id: 2,
      name: "Trà Chanh Kiwi",
      img: "assets/images/img_prod_2.png",
      description:
          "Kiwi, chanh Quảng Đông, đường tinh luyện, hương liệu pha chế.",
      price: 25000,
      salePrice: 19000,
      favorite: 300,
      rating: 4.5,
      save: false,
    ),
    DrinkModel(
        id: 3,
        name: "Dâu Tây Đá xay",
        img: "assets/images/img_prod_3.png",
        description:
            "Thành phần: Dâu tây Đà Lạt, đá tinh khiết, đường mía nguyên chất",
        price: 25000,
        salePrice: 20000,
        favorite: 1200,
        rating: 4.9,
        save: false),
    // Add more DrinkModel items as needed
  ];
}
