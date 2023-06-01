import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AnnouncModel {
  final String noti;
  AnnouncModel({
    required this.noti,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'noti': noti,
    };
  }

  factory AnnouncModel.fromMap(Map<String, dynamic> map) {
    return AnnouncModel(
      noti: (map['noti'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnnouncModel.fromJson(String source) => AnnouncModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
