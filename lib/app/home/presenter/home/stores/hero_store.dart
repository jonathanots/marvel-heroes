import 'package:marvel_heroes/app/home/domain/entities/hero.dart';
import 'package:marvel_heroes/app/home/domain/usecases/fetch_hero_usecase.dart';
import 'package:marvel_heroes/app/home/presenter/home/states/hero_state.dart';
import 'package:mobx/mobx.dart';
part 'hero_store.g.dart';

class HeroStore = _HeroStoreBase with _$HeroStore;

abstract class _HeroStoreBase with Store {
  late final IFecthHeroUsecase _fecthHeroUsecase;

  _HeroStoreBase({required IFecthHeroUsecase fecthHeroUsecase}) {
    _fecthHeroUsecase = fecthHeroUsecase;
  }

  @observable
  List<Hero?> heroes = ObservableList.of([]);

  /// Erase current list of [heroes], and reset [offset] and [limit],
  /// then fetch heroes.
  @action
  Future<void> refresh() async {
    heroes.clear();
    offset = 0;
    limit = 10;

    await fetchHero(offset: offset, limit: limit);
  }

  @observable
  IHeroState state = HeroStart();

  /// Default value [offset] = 0
  @observable
  int offset = 0;

  @action
  nextOffset() => offset += limit;

  /// Default value [limit] = 10
  @observable
  int limit = 10;

  @action
  setLimit(int value) => limit = value;

  @action
  Future<void> fetchHero({int? offset, int? limit, bool paginate = false}) async {
    state = HeroLoading();

    if (paginate) nextOffset();

    final result = await _fecthHeroUsecase.execute(offset: paginate ? this.offset : offset, limit: paginate ? this.limit : limit);

    result.fold((l) => state = HeroError(l), (r) => [(heroes.addAll(r)), (state = HeroSuccess())]);
  }
}
