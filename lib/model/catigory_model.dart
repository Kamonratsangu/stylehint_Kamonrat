import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CatigoryModel {
  final String tags;
  final String url;
  CatigoryModel({
    required this.tags,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tags': tags,
      'url': url,
    };
  }

  factory CatigoryModel.fromMap(Map<String, dynamic> map) {
    return CatigoryModel(
      tags: (map['tags'] ?? '') as String,
      url: (map['url'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CatigoryModel.fromJson(String source) => CatigoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
