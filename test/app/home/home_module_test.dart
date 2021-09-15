import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_heroes/app/app_module.dart';
import 'package:marvel_heroes/app/home/domain/entities/hero.dart';
import 'package:marvel_heroes/app/home/domain/errors/hero_errors.dart';
import 'package:marvel_heroes/app/home/domain/repositories/hero_repository.dart';
import 'package:marvel_heroes/app/home/domain/usecases/fetch_hero_usecase.dart';
import 'package:marvel_heroes/app/home/external/datasources/hero_datasource_impl.dart';
import 'package:marvel_heroes/app/home/home_controller.dart';
import 'package:marvel_heroes/app/home/home_module.dart';
import 'package:marvel_heroes/app/home/infra/datasources/hero_datasource.dart';
import 'package:marvel_heroes/app/home/infra/repositories/hero_repository_impl.dart';
import 'package:marvel_heroes/app/home/presenter/home/states/hero_state.dart';
import 'package:marvel_heroes/app/home/presenter/home/stores/hero_store.dart';
import 'package:marvel_heroes/app/home/utils/hero_response_get_200.dart';
import 'package:marvel_heroes/app/home/utils/hero_response_get_401.dart';
import 'package:marvel_heroes/app/home/utils/hero_response_get_409.dart';
import 'package:marvel_heroes/shared/clients/client_interface.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_module_test.mocks.dart';

class DioClient extends Mock implements IClient {}

@GenerateMocks([DioClient])
void main() {
  late DioClient client;
  late IHeroDatasource datasource;
  late IHeroRepository repository;
  late IFecthHeroUsecase fetchHeroUsecase;
  late HeroStore heroStore;
  late HomeController controller;

  setUp(() {
    client = MockDioClient();

    datasource = HeroDatasourceImpl(client);
    repository = HeroRepositoryImpl(datasource);
    fetchHeroUsecase = FetchHeroUsecase(repository);
    heroStore = HeroStore(fecthHeroUsecase: fetchHeroUsecase);
    controller = HomeController(heroStore: heroStore);

    initModule(
      AppModule(),
      replaceBinds: [
        Bind<IClient>((i) => client),
      ],
    );

    initModule(HomeModule());
  });

  test('should get all injection dependecies', () {
    final client = Modular.get<IClient>();

    expect(client, isA<IClient>());

    final datasource = Modular.get<IHeroDatasource>();

    expect(datasource, isA<HeroDatasourceImpl>());

    final repository = Modular.get<IHeroRepository>();

    expect(repository, isA<HeroRepositoryImpl>());

    final fetchHeroUsecase = Modular.get<IFecthHeroUsecase>();

    expect(fetchHeroUsecase, isA<FetchHeroUsecase>());

    final heroStore = Modular.get<HeroStore>();

    expect(heroStore, isA<HeroStore>());

    final controller = Modular.get<HomeController>();

    expect(controller, isA<HomeController>());
  });

  test('should return a list of heroes', () async {
    when(client.get(any)).thenAnswer((_) async => Response(requestOptions: RequestOptions(path: ''), data: heroResponseGET200, statusCode: 200));

    await controller.fetchHero(offset: 1, limit: 1);

    final result = controller.heroStore.heroes;

    expect(result, isA<List<Hero>>());
  });

  test('should return an unauthorized exception', () async {
    when(client.get(any)).thenAnswer((_) async => Response(requestOptions: RequestOptions(path: ''), data: heroResponseGET401, statusCode: 401));

    await controller.fetchHero(offset: 1, limit: 1);

    final result = controller.heroStore.state;

    expect(result, isA<HeroError>());

    final exception = result as HeroError;

    expect(exception.error, isA<HeroUnauthorizedException>());
  });

  test('should return a conflict exception, but in this case return a empty list of heroes', () async {
    when(client.get(any)).thenAnswer((_) async => Response(requestOptions: RequestOptions(path: ''), data: heroResponseGET409, statusCode: 409));

    await controller.fetchHero(offset: 1, limit: 1);

    final result = controller.heroStore.state;

    expect(result, isA<HeroSuccess>());

    final heroes = controller.heroStore.heroes;

    expect(heroes, isA<List<Hero>>());

    // expect(result, isA<HeroError>());

    // final exception = result as HeroError;

    // expect(exception.error, isA<HeroConflictException>());
  });
}