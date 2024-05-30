import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Product {
  String title;
  double price;
  List<String> image;

  Product({
    required this.title,
    required this.price,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> data) {
    return _$ProductFromJson(data);
  }

  Map<String, dynamic> toJson() {
    return _$ProductToJson(this);
  }
}
