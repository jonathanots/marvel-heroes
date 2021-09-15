// Mocks generated by Mockito 5.0.16 from annotations
// in marvel_heroes/test/app/home/domain/usecases/fetch_hero_usecase_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:marvel_heroes/app/home/domain/entities/hero.dart' as _i6;
import 'package:marvel_heroes/app/home/domain/errors/hero_errors.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

import 'fetch_hero_usecase_test.dart' as _i3;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [HeroRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockHeroRepository extends _i1.Mock implements _i3.HeroRepository {
  MockHeroRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String toString() => super.toString();
  @override
  _i4.Future<_i2.Either<_i5.IHeroException, List<_i6.Hero?>>> fetchHero(
          int? offset, int? limit) =>
      (super.noSuchMethod(Invocation.method(#fetchHero, [offset, limit]),
              returnValue:
                  Future<_i2.Either<_i5.IHeroException, List<_i6.Hero?>>>.value(
                      _FakeEither_0<_i5.IHeroException, List<_i6.Hero?>>()))
          as _i4.Future<_i2.Either<_i5.IHeroException, List<_i6.Hero?>>>);
}