import 'package:marvel_heroes/app/home/domain/entities/comic.dart';
import 'package:marvel_heroes/app/home/domain/errors/hero_errors.dart';
import 'package:marvel_heroes/app/home/domain/entities/hero.dart';
import 'package:dartz/dartz.dart';
import 'package:marvel_heroes/app/home/domain/repositories/hero_repository.dart';
import 'package:marvel_heroes/app/home/infra/datasources/hero_datasource.dart';

class HeroRepositoryImpl implements IHeroRepository {
  final IHeroDatasource datasource;

  HeroRepositoryImpl(this.datasource);

  @override
  Future<Either<IHeroException, List<Hero?>>> fetchHero(int? offset, int? limit) async {
    try {
      final result = await datasource.fetchHero(offset, limit);
      return Right(result);
    } on HeroConflictException catch (e) {
      return Left(e);
    } on HeroUnauthorizedException catch (e) {
      return Left(e);
    } on HeroBadRequestException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<IHeroException, List<Comic?>>> fetchHeroComics(int? heroId, int? offset, int? limit) async {
    try {
      final result = await datasource.fetchHeroComics(heroId, offset, limit);
      return Right(result);
    } on HeroConflictException catch (e) {
      return Left(e);
    } on HeroUnauthorizedException catch (e) {
      return Left(e);
    } on HeroBadRequestException catch (e) {
      return Left(e);
    }
  }
}
