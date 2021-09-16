class Comic {
  final int id;
  final String title;
  final double issueNumber;
  // Some comics has `null` for description
  final String? description;
  final int pageCount;
  final String thumbnail;

  Comic({
    required this.id,
    required this.title,
    required this.issueNumber,
    required this.description,
    required this.pageCount,
    required this.thumbnail,
  });
}
