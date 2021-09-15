import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_heroes/app/home/home_module.dart';
import 'package:marvel_heroes/shared/clients/implementations/dio_client_impl.dart';
import 'package:marvel_heroes/shared/clients/interceptors/track_interceptor.dart';
import 'package:marvel_heroes/shared/utils/contants.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DioClientImpl(baseUrl: baseUrl, queryAuth: queryAuth, interceptors: [TrackInterceptor()]))
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
