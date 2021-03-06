import 'package:dartz/dartz.dart';
import 'package:marvel_heroes/app/home/domain/entities/comic.dart';
import 'package:marvel_heroes/app/home/domain/entities/hero.dart';
import 'package:marvel_heroes/app/home/domain/errors/hero_errors.dart';

abstract class IHeroRepository {
  Future<Either<IHeroException, List<Hero?>>> fetchHero(int? offset, int? limit);
  Future<Either<IHeroException, List<Comic?>>> fetchHeroComics(int? heroId, int? offset, int? limit);
}
