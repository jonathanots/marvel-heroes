import 'package:marvel_heroes/app/home/presenter/details/stores/comic_store.dart';
import 'package:marvel_heroes/app/home/presenter/home/stores/hero_store.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HeroStore heroStore;
  final ComicStore comicStore;

  _HomeControllerBase({required this.heroStore, required this.comicStore});

  Future<void> fetchHero({int? offset, int? limit, bool paginate = false}) async {
    await heroStore.fetchHero(offset: offset, limit: limit, paginate: paginate);
  }

  Future<void> fetchHeroComics({int? offset, int? limit, bool paginate = false}) async {
    await comicStore.fetchHeroComics(offset: offset, limit: limit, paginate: paginate);
  }
}
