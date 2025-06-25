import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_suit/core/helpers/extensions.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CachedNetworkImage(
            imageUrl: image,
            imageBuilder:
                (context, imageProvider) =>
                    CircleAvatar(radius: 30, backgroundImage: imageProvider),
            placeholder:
                (context, url) => const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
            errorWidget:
                (context, url, error) => const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.error, color: Colors.white),
                ),
          ),
          6.0.height,
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
