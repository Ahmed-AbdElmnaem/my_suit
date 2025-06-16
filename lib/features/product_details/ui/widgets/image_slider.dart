import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final List<String> images;

  const ImageSlider({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (_, index) {
          return Image.network(
            images[index],
            fit: BoxFit.cover,
            width: double.infinity,
          );
        },
      ),
    );
  }
}
