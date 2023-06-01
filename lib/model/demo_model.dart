import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DemoModel {
  final String name;
  final String url;
  final String tag;
  final String tags;
  final int star;
  DemoModel({
    required this.name,
    required this.url,
    required this.tag,
    required this.tags,
    required this.star,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
      'tag': tag,
      'tags': tags,
      'star': star,
    };
  }

  factory DemoModel.fromMap(Map<String, dynamic> map) {
    return DemoModel(
      name: (map['name'] ?? '') as String,
      url: (map['url'] ?? '') as String,
      tag: (map['tag'] ?? '') as String,
      tags: (map['tags'] ?? '') as String,
      star: (map['star'] ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DemoModel.fromJson(String source) =>
      DemoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
