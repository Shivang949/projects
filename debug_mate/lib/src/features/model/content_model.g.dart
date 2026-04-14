// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentModel _$ContentModelFromJson(Map<String, dynamic> json) => ContentModel(
      title: json['title'] as String,
      subTitle: json['subTitle'] as String,
      path: json['path'] as String,
      identifier: json['identifier'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      title: json['title'] as String,
      subTitle: json['subTitle'] as String?,
    );
