import 'package:dartz/dartz.dart';
import 'package:marvel_heroes/app/home/domain/entities/hero.dart';
import 'package:marvel_heroes/app/home/domain/errors/hero_errors.dart';
import 'package:marvel_heroes/app/home/domain/repositories/hero_repository.dart';

abstract class IFecthHeroUsecase {
  Future<Either<IHeroException, List<Hero?>>> execute({required int? offset, required int? limit});
}

class FetchHeroUsecase implements IFecthHeroUsecase {
  final IHeroRepository repository;

  FetchHeroUsecase(this.repository);

  @override
  Future<Either<IHeroException, List<Hero?>>> execute({required int? offset, required int? limit}) async {
    if (offset == null || offset < 0)
      return Left(HeroOffsetException('Invalid offset argument, please pass a valid offset non-null, and greater than or equal 0'));
    else if (limit == null || limit < 1)
      return Left(HeroLimitException('Invalid limit argument, please pass a valid limit non-null, and greater than or equal 1'));

    return await repository.fetchHero(offset, limit);
  }
}
