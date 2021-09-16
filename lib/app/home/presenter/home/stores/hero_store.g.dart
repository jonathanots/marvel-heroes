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

  final _$offsetAtom = Atom(name: '_HeroStoreBase.offset');

  @override
  int get offset {
    _$offsetAtom.reportRead();
    return super.offset;
  }

  @override
  set offset(int value) {
    _$offsetAtom.reportWrite(value, super.offset, () {
      super.offset = value;
    });
  }

  final _$limitAtom = Atom(name: '_HeroStoreBase.limit');

  @override
  int get limit {
    _$limitAtom.reportRead();
    return super.limit;
  }

  @override
  set limit(int value) {
    _$limitAtom.reportWrite(value, super.limit, () {
      super.limit = value;
    });
  }

  final _$refreshAsyncAction = AsyncAction('_HeroStoreBase.refresh');

  @override
  Future<void> refresh() {
    return _$refreshAsyncAction.run(() => super.refresh());
  }

  final _$fetchHeroAsyncAction = AsyncAction('_HeroStoreBase.fetchHero');

  @override
  Future<void> fetchHero({int? offset, int? limit, bool paginate = false}) {
    return _$fetchHeroAsyncAction.run(() =>
        super.fetchHero(offset: offset, limit: limit, paginate: paginate));
  }

  final _$_HeroStoreBaseActionController =
      ActionController(name: '_HeroStoreBase');

  @override
  dynamic nextOffset() {
    final _$actionInfo = _$_HeroStoreBaseActionController.startAction(
        name: '_HeroStoreBase.nextOffset');
    try {
      return super.nextOffset();
    } finally {
      _$_HeroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLimit(int value) {
    final _$actionInfo = _$_HeroStoreBaseActionController.startAction(
        name: '_HeroStoreBase.setLimit');
    try {
      return super.setLimit(value);
    } finally {
      _$_HeroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
heroes: ${heroes},
state: ${state},
offset: ${offset},
limit: ${limit}
    ''';
  }
}
