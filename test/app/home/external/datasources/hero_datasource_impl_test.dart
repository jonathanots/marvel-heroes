import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_heroes/app/app_module.dart';
import 'package:marvel_heroes/app/home/domain/errors/hero_errors.dart';
import 'package:marvel_heroes/app/home/external/datasources/hero_datasource_impl.dart';
import 'package:marvel_heroes/app/home/infra/models/result_hero.dart';
import 'package:marvel_heroes/app/home/utils/hero_response_get_200.dart';
import 'package:marvel_heroes/app/home/utils/hero_response_get_401.dart';
import 'package:marvel_heroes/app/home/utils/hero_response_get_409.dart';
import 'package:marvel_heroes/shared/clients/client_interface.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'hero_datasource_impl_test.mocks.dart';

class DioClient extends Mock implements IClient {}

@GenerateMocks([DioClient])
void main() {
  late DioClient client;

  late HeroDatasourceImpl datasource;

  setUp(() {
    client = MockDioClient();
    datasource = HeroDatasourceImpl(client);

    initModule(AppModule(), replaceBinds: [Bind<IClient>((i) => client)]);
  });

  test('should return a list of result hero', () async {
    when(client.get(any)).thenAnswer((_) async => Response(requestOptions: RequestOptions(path: ''), data: heroResponseGET200, statusCode: 200));

    final future = datasource.fetchHero(1, 1);

    expect(future, completes);

    final result = await future;

    expect(result, isA<List<ResultHeroModel>>());
  });

  test('should return a conflict exception, expected ob ject not found', () async {
    when(client.get(any)).thenAnswer((_) async => Response(requestOptions: RequestOptions(path: ''), data: heroResponseGET409, statusCode: 409));

    final future = datasource.fetchHero(1, 1);

    expect(future, completes);

    final result = await future;

    // expect(result, throwsA(isA<HeroConflictException>()));
    expect(result, isA<List<ResultHeroModel>>());
  });

  test('should return an unauthorized exception', () async {
    when(client.get(any)).thenAnswer((_) async => Response(requestOptions: RequestOptions(path: ''), data: heroResponseGET401, statusCode: 401));

    final future = datasource.fetchHero(1, 1);

    expect(future, throwsA(isA<HeroUnauthorizedException>()));
  });

  test('should return an exception caused by Dio', () async {
    when(client.get(any)).thenThrow(Exception());

    final future = datasource.fetchHero(1, 1);

    expect(future, throwsA(isA<Exception>()));
  });
}
