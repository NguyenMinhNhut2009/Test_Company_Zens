class DrinkModel {
  int? id;
  String? name;
  String? img;
  String? description;
  int? price;
  int? salePrice;
  int? favorite;
  double? rating;
  bool? save;

  DrinkModel(
      {this.id,
      this.name,
      this.img,
      this.description,
      this.price,
      this.salePrice,
      this.favorite,
      this.rating,
      this.save});
}
