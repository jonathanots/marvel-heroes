import 'package:dartz/dartz.dart';
import 'package:marvel_heroes/app/home/domain/entities/comic.dart';
import 'package:marvel_heroes/app/home/domain/errors/hero_errors.dart';
import 'package:marvel_heroes/app/home/domain/repositories/hero_repository.dart';

abstract class IFetchHeroComicsUsecase {
  Future<Either<IHeroException, List<Comic?>>> execute({required int? heroId, required int? offset, required int? limit});
}

class FetchHeroComicsUsecase implements IFetchHeroComicsUsecase {
  final IHeroRepository repository;

  FetchHeroComicsUsecase(this.repository);

  @override
  Future<Either<IHeroException, List<Comic?>>> execute({required int? heroId, required int? offset, required int? limit}) async {
    //TODO: Create DTO and Validator for required fields

    if (heroId == null || heroId < 1)
      return Left(HeroDataException('Invalid hero id argument, please pass a valid hero id non-null, and greater than or equal 0'));
    else if (offset == null || offset < 0)
      return Left(HeroOffsetException('Invalid offset argument, please pass a valid offset non-null, and greater than or equal 0'));
    else if (limit == null || limit < 1)
      return Left(HeroLimitException('Invalid limit argument, please pass a valid limit non-null, and greater than or equal 1'));

    return await repository.fetchHeroComics(heroId, offset, limit);
  }
}
