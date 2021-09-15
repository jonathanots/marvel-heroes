// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HeroStore on _HeroStoreBase, Store {
  final _$heroesAtom = Atom(name: '_HeroStoreBase.heroes');

  @override
  List<Hero?> get heroes {
    _$heroesAtom.reportRead();
    return super.heroes;
  }

  @override
  set heroes(List<Hero?> value) {
    _$heroesAtom.reportWrite(value, super.heroes, () {
      super.heroes = value;
    });
  }

  final _$stateAtom = Atom(name: '_HeroStoreBase.state');

  @override
  IHeroState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(IHeroState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$fetchHeroAsyncAction = AsyncAction('_HeroStoreBase.fetchHero');

  @override
  Future<void> fetchHero({required int? offset, required int? limit}) {
    return _$fetchHeroAsyncAction
        .run(() => super.fetchHero(offset: offset, limit: limit));
  }

  @override
  String toString() {
    return '''
heroes: ${heroes},
state: ${state}
    ''';
  }
}
