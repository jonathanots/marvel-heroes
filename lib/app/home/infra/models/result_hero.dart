import 'dart:convert';

import 'package:marvel_heroes/app/home/domain/entities/hero.dart';

class ResultHeroModel extends Hero {
  ResultHeroModel({
    required int id,
    required String name,
    required String description,
    required String thumbnail,
  }) : super(
          id: id,
          name: name,
          description: description,
          thumbnail: thumbnail,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'description': this.description,
      'thumbnail': this.thumbnail,
    };
  }

  factory ResultHeroModel.fromMap(Map<String, dynamic> map) {
    return ResultHeroModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      thumbnail: "${map['thumbnail']['path']}.${map['thumbnail']['extension']}",
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultHeroModel.fromJson(String source) {
    return ResultHeroModel.fromMap(jsonDecode(source));
  }

  static List<ResultHeroModel> fromJsonList(dynamic source) {
    if (source is List) return source.map((item) => ResultHeroModel.fromMap(item)).toList();
    return [];
  }
}
