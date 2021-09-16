import 'package:marvel_heroes/app/home/infra/models/result_hero.dart';

abstract class IHeroDatasource {
  Future<List<ResultHeroModel>> fetchHero(int? offset, int? limit);
}
