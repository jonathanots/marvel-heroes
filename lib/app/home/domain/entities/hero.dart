class Hero {
  final int id;
  final String name;
  final String description;
  final String thumbnail;
  final int comicAppearences;
  final List<String> comicsUrl;

  Hero({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
    required this.comicAppearences,
    required this.comicsUrl,
  });
}
