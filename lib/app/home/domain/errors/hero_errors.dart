abstract class IHeroException implements Exception {
  final String message;

  IHeroException(this.message);
}

/// Some error related at one [data] about the hero variable into the usecase
class HeroDataException extends IHeroException {
  HeroDataException(String message) : super(message);
}

/// Some error related at [offset] variable into the usecase
class HeroOffsetException extends IHeroException {
  HeroOffsetException(String message) : super(message);
}

/// Some error related at [limit] variable into the usecase
class HeroLimitException extends IHeroException {
  HeroLimitException(String message) : super(message);
}

/// Something caused conflicting at using the API - code 409
class HeroConflictException extends IHeroException {
  HeroConflictException(String message) : super(message);
}

/// Something bad happened while performing the request
class HeroBadRequestException extends IHeroException {
  HeroBadRequestException(String message) : super(message);
}

/// Request is not authorized, invalid credentials
class HeroUnauthorizedException extends IHeroException {
  HeroUnauthorizedException(String message) : super(message);
}
