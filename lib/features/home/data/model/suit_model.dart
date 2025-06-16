class SuitModel {
  final String id;
  final String name;
  final String image;
  final String brand;
  final String type;
  final double price;
  final bool isFavorite;

  SuitModel({
    required this.id,
    required this.name,
    required this.image,
    required this.brand,
    required this.type,
    required this.price,
    this.isFavorite = false,
  });
}
