import 'dart:convert';

import 'package:marvel_heroes/app/home/domain/entities/comic.dart';

class ResultComicModel extends Comic {
  ResultComicModel({
    required int id,
    required String title,
    required double issueNumber,
    required String description,
    required int pageCount,
    required String thumbnail,
  }) : super(
          id: id,
          title: title,
          issueNumber: issueNumber,
          description: description,
          pageCount: pageCount,
          thumbnail: thumbnail,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'issueNumber': this.issueNumber,
      'description': this.description,
      'pageCount': this.pageCount,
      'thumbnail': this.thumbnail,
    };
  }

  factory ResultComicModel.fromMap(Map<String, dynamic> map) {
    return ResultComicModel(
      id: map['id'],
      title: map['title'],
      issueNumber: double.parse(map['issueNumber'].toString()),
      description: map['description'],
      pageCount: map['pageCount'],
      thumbnail: "${map['thumbnail']['path']}.${map['thumbnail']['extension']}",
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultComicModel.fromJson(String source) {
    return ResultComicModel.fromMap(jsonDecode(source));
  }

  static List<ResultComicModel> fromJsonList(dynamic source) {
    if (source is List) return source.map((item) => ResultComicModel.fromMap(item)).toList();
    return [];
  }
}
