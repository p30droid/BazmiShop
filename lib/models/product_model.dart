


import 'package:json_annotation/json_annotation.dart';
import 'gallery_model.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Product {


  String id;
  String catId;
  String catName;
  String title;
  String brand;
  String garanti;
  String count;
  String shortDescription;
  String fullDescription;
  String special;
  String discount;
  String rate;
  String price;
  String icon;
  List<Gallery> gallery;



  Product(
      { required this.id,
        required this.catId,
        required this.catName,
        required this.title,
        required this.brand,
        required this.garanti,
        required this.count,
        required this.shortDescription,
        required this.fullDescription,
        required this.special,
        required this.discount,
        required this.rate,
        required this.price,
        required this.icon,
        required this.gallery
      });


  factory Product.fromJson(Map<String , dynamic> json) => _$ProductFromJson(json);

  Map<String , dynamic> toJson() => _$ProductToJson(this);




}