class DetailEntity {
  const DetailEntity({
    required this.likes,
    required this.points,
    required this.popularity,
    required this.description,
  });

  final int likes;
  final int? points;
  final double? popularity;
  final String description;
}
