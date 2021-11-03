import 'package:bazmi_shop/models/news_model.dart';
import 'package:bazmi_shop/models/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_model.g.dart';


@JsonSerializable()
class BaseModel {


  @JsonKey(name: "news")
  List<News> news;
  @JsonKey(name: "mobile")
  List<Product> mobile;
  @JsonKey(name: "makeup")
  List<Product> makeup;
  @JsonKey(name: "discount")
  List<Product> discount;
  @JsonKey(name: "AmazingOffer")
  List<Product> AmazingOffer;

  BaseModel({required this.news, required this.mobile, required this.makeup,
    required this.discount, required this.AmazingOffer});


  factory BaseModel.fromJson(Map<String, dynamic> json) => _$BaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseModelToJson(this);


}