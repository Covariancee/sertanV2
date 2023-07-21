

class Meal {
  const Meal(
      {required this.id,
      required this.categories,
      required this.title,
      required this.image,
      required this.duration,
      required this.price,
      required this.detail});

  final String id;
  final List<String> categories;
  final String title;
  final String image;
  final int duration;
  final String price;
  final String detail;
}
