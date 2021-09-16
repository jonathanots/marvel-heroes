import 'package:marvel_heroes/app/home/domain/errors/hero_errors.dart';

abstract class IHeroComicState {}

class HeroComicStart implements IHeroComicState {}

class HeroComicLoading implements IHeroComicState {}

class HeroComicSuccess implements IHeroComicState {}

class HeroComicError implements IHeroComicState {
  final IHeroException error;

  HeroComicError(this.error);
}
