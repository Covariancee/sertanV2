enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Meal {
  const Meal(
      {required this.id,
      required this.categories,
      required this.title,
      required this.image,
      required this.duration,
      required this.affordability,
      required this.detail});

  final String id;
  final List<String> categories;
  final String title;
  final String image;
  final int duration;
  final Affordability affordability;
  final String detail;
}
