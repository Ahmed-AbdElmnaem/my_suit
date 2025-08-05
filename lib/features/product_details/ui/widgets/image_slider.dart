import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final List<String> images;
  final PageController controller;

  const ImageSlider({
    super.key,
    required this.images,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: images.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(images[index], fit: BoxFit.cover),
        );
      },
    );
  }
}
