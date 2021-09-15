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

  @observable
  IHeroState state = HeroStart();

  @action
  Future<void> fetchHero({required int? offset, required int? limit}) async {
    state = HeroLoading();

    final result = await _fecthHeroUsecase.execute(offset: offset, limit: limit);

    result.fold((l) => state = HeroError(l), (r) => [(heroes = r), (state = HeroSuccess())]);
  }
}
