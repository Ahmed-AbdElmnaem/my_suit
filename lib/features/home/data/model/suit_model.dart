import 'dart:ui';

class SuitModel {
  final String id;
  final String name;
  final String brand;
  final double price;
  final String image;
  final String type;
  final bool isFavorite;
  final List<String> availableSizes;
  final List<Color> availableColors;

  SuitModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.image,
    required this.type,
    required this.isFavorite,
    required this.availableSizes,
    required this.availableColors,
  });

  SuitModel copyWith({
    String? id,
    String? name,
    String? brand,
    double? price,
    String? image,
    String? type,
    bool? isFavorite,
    List<String>? availableSizes,
    List<Color>? availableColors,
  }) {
    return SuitModel(
      id: id ?? this.id,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      price: price ?? this.price,
      image: image ?? this.image,
      type: type ?? this.type,
      isFavorite: isFavorite ?? this.isFavorite,
      availableSizes: availableSizes ?? this.availableSizes,
      availableColors: availableColors ?? this.availableColors,
    );
  }
}
