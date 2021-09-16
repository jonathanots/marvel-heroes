import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_heroes/app/home/domain/errors/hero_errors.dart';
import 'package:marvel_heroes/app/home/infra/datasources/hero_datasource.dart';
import 'package:marvel_heroes/app/home/infra/models/result_hero.dart';
import 'package:marvel_heroes/app/home/infra/repositories/hero_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'hero_repository_impl_test.mocks.dart';

class HeroDatasource extends Mock implements IHeroDatasource {}

@GenerateMocks([HeroDatasource])
void main() {
  late HeroDatasource datasource;

  late HeroRepositoryImpl repository;

  setUp(() {
    datasource = MockHeroDatasource();
    repository = HeroRepositoryImpl(datasource);
  });

  test('should return a list of result catalog', () async {
    when(datasource.fetchHero(any, any)).thenAnswer((_) async => <ResultHeroModel>[]);

    final result = await repository.fetchHero(1, 1);

    expect(result.fold(id, id), isA<List<ResultHeroModel>>());
  });

  test('should return a bad request exception when datasource emits a bad request exception', () async {
    when(datasource.fetchHero(any, any)).thenThrow(HeroBadRequestException(''));

    final result = await repository.fetchHero(1, 1);

    expect(result.fold(id, id), isA<HeroBadRequestException>());
  });

  test('should return a conflict exception when datasource emits a conflict exception', () async {
    when(datasource.fetchHero(any, any)).thenThrow(HeroConflictException(''));

    final result = await repository.fetchHero(1, 1);

    expect(result.fold(id, id), isA<HeroConflictException>());
  });
}
