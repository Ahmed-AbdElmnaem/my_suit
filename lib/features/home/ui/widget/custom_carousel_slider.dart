import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCarouselSlider extends StatelessWidget {
  final List<String> imageUrls;
  final void Function(int index)? onTap;

  const CustomCarouselSlider({super.key, required this.imageUrls, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imageUrls.length,
      options: CarouselOptions(
        aspectRatio: 14 / 7,
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayInterval: const Duration(seconds: 4),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        viewportFraction: 0.85,
        scrollDirection: Axis.horizontal,
      ),
      itemBuilder: (context, index, realIndex) {
        final imageUrl = imageUrls[index];

        return GestureDetector(
          onTap: () => onTap?.call(index),
          child: Hero(
            tag: 'image_$index',
            transitionOnUserGestures: true,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0.r),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        value:
                            progress.expectedTotalBytes != null
                                ? progress.cumulativeBytesLoaded /
                                    progress.expectedTotalBytes!
                                : null,
                      ),
                    );
                  },
                  errorBuilder:
                      (_, __, ___) => const Center(
                        child: Icon(Icons.broken_image, size: 40),
                      ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
