// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ComicStore on _ComicStoreBase, Store {
  final _$comicsAtom = Atom(name: '_ComicStoreBase.comics');

  @override
  List<Comic?> get comics {
    _$comicsAtom.reportRead();
    return super.comics;
  }

  @override
  set comics(List<Comic?> value) {
    _$comicsAtom.reportWrite(value, super.comics, () {
      super.comics = value;
    });
  }

  final _$heroIdAtom = Atom(name: '_ComicStoreBase.heroId');

  @override
  int? get heroId {
    _$heroIdAtom.reportRead();
    return super.heroId;
  }

  @override
  set heroId(int? value) {
    _$heroIdAtom.reportWrite(value, super.heroId, () {
      super.heroId = value;
    });
  }

  final _$stateAtom = Atom(name: '_ComicStoreBase.state');

  @override
  IHeroComicState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(IHeroComicState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$offsetAtom = Atom(name: '_ComicStoreBase.offset');

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

  final _$limitAtom = Atom(name: '_ComicStoreBase.limit');

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

  final _$refreshAsyncAction = AsyncAction('_ComicStoreBase.refresh');

  @override
  Future<void> refresh() {
    return _$refreshAsyncAction.run(() => super.refresh());
  }

  final _$fetchHeroComicsAsyncAction =
      AsyncAction('_ComicStoreBase.fetchHeroComics');

  @override
  Future<void> fetchHeroComics(
      {int? offset, int? limit, bool paginate = false}) {
    return _$fetchHeroComicsAsyncAction.run(() => super
        .fetchHeroComics(offset: offset, limit: limit, paginate: paginate));
  }

  final _$_ComicStoreBaseActionController =
      ActionController(name: '_ComicStoreBase');

  @override
  dynamic setHeroId(int? value) {
    final _$actionInfo = _$_ComicStoreBaseActionController.startAction(
        name: '_ComicStoreBase.setHeroId');
    try {
      return super.setHeroId(value);
    } finally {
      _$_ComicStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic nextOffset() {
    final _$actionInfo = _$_ComicStoreBaseActionController.startAction(
        name: '_ComicStoreBase.nextOffset');
    try {
      return super.nextOffset();
    } finally {
      _$_ComicStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLimit(int value) {
    final _$actionInfo = _$_ComicStoreBaseActionController.startAction(
        name: '_ComicStoreBase.setLimit');
    try {
      return super.setLimit(value);
    } finally {
      _$_ComicStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearComics() {
    final _$actionInfo = _$_ComicStoreBaseActionController.startAction(
        name: '_ComicStoreBase.clearComics');
    try {
      return super.clearComics();
    } finally {
      _$_ComicStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
comics: ${comics},
heroId: ${heroId},
state: ${state},
offset: ${offset},
limit: ${limit}
    ''';
  }
}
