import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_heroes/app/home/domain/repositories/hero_repository.dart';
import 'package:marvel_heroes/app/home/domain/usecases/fetch_hero_comics_usecase.dart';
import 'package:marvel_heroes/app/home/domain/usecases/fetch_hero_usecase.dart';
import 'package:marvel_heroes/app/home/external/datasources/hero_datasource_impl.dart';
import 'package:marvel_heroes/app/home/home_controller.dart';
import 'package:marvel_heroes/app/home/infra/datasources/hero_datasource.dart';
import 'package:marvel_heroes/app/home/infra/repositories/hero_repository_impl.dart';
import 'package:marvel_heroes/app/home/presenter/details/hero_details_page.dart';
import 'package:marvel_heroes/app/home/presenter/details/stores/comic_store.dart';
import 'package:marvel_heroes/app/home/presenter/home/home_page.dart';
import 'package:marvel_heroes/app/home/presenter/home/stores/hero_store.dart';
import 'package:marvel_heroes/shared/clients/client_interface.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HeroDatasourceImpl(i<IClient>())),
    Bind.lazySingleton((i) => HeroRepositoryImpl(i<IHeroDatasource>())),
    Bind.lazySingleton((i) => FetchHeroUsecase(i<IHeroRepository>())),
    Bind.lazySingleton((i) => FetchHeroComicsUsecase(i<IHeroRepository>())),
    Bind.lazySingleton((i) => ComicStore(fetchHeroComicsUsecase: i<IFetchHeroComicsUsecase>())),
    Bind.lazySingleton((i) => HeroStore(fecthHeroUsecase: i<IFecthHeroUsecase>())),
    Bind.lazySingleton((i) => HomeController(heroStore: i<HeroStore>(), comicStore: i<ComicStore>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
    ChildRoute(
      '/character/:id',
      child: (_, args) => HeroDetailsPage(
        heroId: int.tryParse(args.params['id']),
        hero: args.data,
      ),
    ),
  ];
}
