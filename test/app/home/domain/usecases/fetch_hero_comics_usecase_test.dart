import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_heroes/app/home/domain/entities/comic.dart';
import 'package:marvel_heroes/app/home/domain/errors/hero_errors.dart';
import 'package:marvel_heroes/app/home/domain/repositories/hero_repository.dart';
import 'package:marvel_heroes/app/home/domain/usecases/fetch_hero_comics_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_hero_comics_usecase_test.mocks.dart';

class HeroRepository extends Mock implements IHeroRepository {}

@GenerateMocks([HeroRepository])
void main() {
  late HeroRepository repository;

  late IFetchHeroComicsUsecase fetchHeroUsecase;

  setUp(() {
    repository = MockHeroRepository();
    fetchHeroUsecase = FetchHeroComicsUsecase(repository);
  });

  test('should return a list of comics', () async {
    when(repository.fetchHeroComics(any, any, any)).thenAnswer((_) async => Right(<Comic>[]));

    final future = fetchHeroUsecase.execute(heroId: 1, offset: 1, limit: 1);

    expect(future, completes);

    final result = await future;

    expect(result.fold(id, id), isA<List<Comic>>());
  });

  test('should return a bad request exception', () async {
    when(repository.fetchHeroComics(any, any, any)).thenAnswer((_) async => Left(HeroBadRequestException('')));

    final future = fetchHeroUsecase.execute(heroId: 1, offset: 1, limit: 1);

    expect(future, completes);

    final result = await future;

    expect(result.fold(id, id), isA<HeroBadRequestException>());
  });

  test('should return a conflict request exception', () async {
    when(repository.fetchHeroComics(any, any, any)).thenAnswer((_) async => Left(HeroConflictException('')));

    final future = fetchHeroUsecase.execute(heroId: 1, offset: 1, limit: 1);

    expect(future, completes);

    final result = await future;

    expect(result.fold(id, id), isA<HeroConflictException>());
  });

  test('should return a invalid hero id exception when null', () async {
    when(repository.fetchHeroComics(any, any, any)).thenAnswer((_) async => Left(HeroDataException('Null value')));

    final future = fetchHeroUsecase.execute(heroId: null, offset: 1, limit: 1);

    expect(future, completes);

    final result = await future;

    expect(result.fold(id, id), isA<HeroDataException>());
  });

  test('should return a invalid offset exception when less than 1', () async {
    when(repository.fetchHeroComics(any, any, any)).thenAnswer((_) async => Left(HeroDataException('Hero id is less than 1')));

    final future = fetchHeroUsecase.execute(heroId: 0, offset: 1, limit: 1);

    expect(future, completes);

    final result = await future;

    expect(result.fold(id, id), isA<HeroDataException>());
  });

  test('should return a invalid offset exception when null', () async {
    when(repository.fetchHeroComics(any, any, any)).thenAnswer((_) async => Left(HeroOffsetException('Null value')));

    final future = fetchHeroUsecase.execute(heroId: 1, offset: null, limit: 1);

    expect(future, completes);

    final result = await future;

    expect(result.fold(id, id), isA<HeroOffsetException>());
  });

  test('should return a invalid offset exception when less than 0', () async {
    when(repository.fetchHeroComics(any, any, any)).thenAnswer((_) async => Left(HeroOffsetException('Negative value')));

    final future = fetchHeroUsecase.execute(heroId: 1, offset: -1, limit: 1);

    expect(future, completes);

    final result = await future;

    expect(result.fold(id, id), isA<HeroOffsetException>());
  });

  test('should return a invalid limit exception when null', () async {
    when(repository.fetchHeroComics(any, any, any)).thenAnswer((_) async => Left(HeroLimitException('Null value')));

    final future = fetchHeroUsecase.execute(heroId: 1, offset: 1, limit: null);

    expect(future, completes);

    final result = await future;

    expect(result.fold(id, id), isA<HeroLimitException>());
  });

  test('should return a invalid limit exception when less than 1', () async {
    when(repository.fetchHeroComics(any, any, any)).thenAnswer((_) async => Left(HeroLimitException('Less than 1')));

    final future = fetchHeroUsecase.execute(heroId: 1, offset: 1, limit: 0);

    expect(future, completes);

    final result = await future;

    expect(result.fold(id, id), isA<HeroLimitException>());
  });
}
