import 'package:json_annotation/json_annotation.dart';

part 'content_model.g.dart';

@JsonSerializable(createToJson: false)
class ContentModel {
  final String title;
  final String subTitle;
  final String path;
  final String identifier;
  final List<Items> items;

  ContentModel({
    required this.title,
    required this.subTitle,
    required this.path,
    required this.identifier,
    required this.items,
});
  factory ContentModel.fromJson(Map<String, dynamic> json) =>
      _$ContentModelFromJson(json);

}

@JsonSerializable(createToJson: false)
class Items {
  final String title;
  final String? subTitle;

  Items({
    required this.title,
    this.subTitle,
});
  factory Items.fromJson(Map<String, dynamic> json) =>
      _$ItemsFromJson(json);
}

