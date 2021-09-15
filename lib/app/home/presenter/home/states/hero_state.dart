import 'package:marvel_heroes/app/home/domain/errors/hero_errors.dart';

abstract class IHeroState {}

class HeroStart implements IHeroState {}

class HeroLoading implements IHeroState {}

class HeroSuccess implements IHeroState {}

class HeroError implements IHeroState {
  final IHeroException error;

  HeroError(this.error);
}
