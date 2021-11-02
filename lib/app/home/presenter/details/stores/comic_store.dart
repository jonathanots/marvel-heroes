import 'package:marvel_heroes/app/home/domain/entities/comic.dart';
import 'package:marvel_heroes/app/home/domain/usecases/fetch_hero_comics_usecase.dart';
import 'package:marvel_heroes/app/home/presenter/details/states/comic_state.dart';
import 'package:mobx/mobx.dart';
part 'comic_store.g.dart';

class ComicStore = _ComicStoreBase with _$ComicStore;

abstract class _ComicStoreBase with Store {
  late final IFetchHeroComicsUsecase _fetchHeroComicsUsecase;

  _ComicStoreBase({required IFetchHeroComicsUsecase fetchHeroComicsUsecase}) {
    _fetchHeroComicsUsecase = fetchHeroComicsUsecase;
  }

  @observable
  List<Comic?> comics = ObservableList.of([]);

  /// Erase current list of [heroes], and reset [offset] and [limit],
  /// then fetch heroes.
  @action
  Future<void> refresh() async {
    comics.clear();
    offset = 0;
    limit = 10;

    await fetchHeroComics(offset: offset, limit: limit);
  }

  /// Current hero [id]. Default is `null`.
  @observable
  int? heroId;

  @action
  setHeroId(int? value) => heroId = value;

  @observable
  IHeroComicState state = HeroComicStart();

  /// Default value [offset] = 0
  @observable
  int offset = 0;

  @action
  nextOffset() => offset += limit;

  /// Default value [limit] = 100
  @observable
  int limit = 10;

  @action
  setLimit(int value) => limit = value;

  @action
  Future<void> fetchHeroComics({int? offset, int? limit, bool paginate = false}) async {
    state = HeroComicLoading();

    if (paginate) nextOffset();

    final result = await _fetchHeroComicsUsecase.execute(heroId: heroId, offset: paginate ? this.offset : offset, limit: paginate ? this.limit : limit);

    result.fold((l) => state = HeroComicError(l), (r) => [(comics.addAll(r)), (state = HeroComicSuccess())]);
  }

  @action
  void clearComics() {
    comics.clear();
    offset = 0;
    limit = 10;
  }
}
