import 'package:marvel_heroes/app/home/presenter/home/stores/hero_store.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HeroStore heroStore;

  _HomeControllerBase({required this.heroStore});

  Future<void> fetchHero({required int? offset, required int? limit}) async {
    await heroStore.fetchHero(offset: offset, limit: limit);
  }
}
