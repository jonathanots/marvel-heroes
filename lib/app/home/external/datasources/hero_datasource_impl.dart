import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:marvel_heroes/app/home/domain/errors/hero_errors.dart';
import 'package:marvel_heroes/app/home/infra/datasources/hero_datasource.dart';
import 'package:marvel_heroes/app/home/infra/models/result_hero.dart';
import 'package:marvel_heroes/shared/clients/client_interface.dart';

class HeroDatasourceImpl implements IHeroDatasource {
  final IClient client;

  HeroDatasourceImpl(this.client);

  @override
  Future<List<ResultHeroModel>> fetchHero(int? offset, int? limit) async {
    final response = await client.get('characters') as Response;
    final data = jsonDecode(response.data);
    if (response.statusCode == 200) {
      // Access directly array of heroes data
      return ResultHeroModel.fromJsonList(data['data']['results']);
    } else if (response.statusCode == 409) {
      // Getting status field that describes the error, previous knowledge from API.
      // throw HeroConflictException('${data['status']}');

      //Returning an empty list avoiding any error related at code status 409
      return [];
    } else if (response.statusCode == 401) {
      // Getting status field that describes the error, previous knowledge from API.
      throw HeroUnauthorizedException('Unauthorized. ${data['message']}');
    } else {
      throw HeroBadRequestException('Internal Server Error');
    }
  }
}
