
import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class News {


  String id;
  String title;
  String icon;
  String type;
  String link;

  News({required this.id, required this.title, required this.icon,
    required this.type, required this.link});


  factory News.fromJson(Map<String , dynamic> json) => _$NewsFromJson(json);

  Map<String , dynamic> toJson() => _$NewsToJson(this);


}