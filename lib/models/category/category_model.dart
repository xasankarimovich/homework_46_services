import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  String image;
  String name;

  CategoryModel({required this.image, required this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> data) {
    return _$CategoryModelFromJson(data);
  }

  Map<String, dynamic> toJson() {
    return _$CategoryModelToJson(this);
  }
}
