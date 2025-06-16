import 'package:flutter/material.dart';
import 'package:my_suit/core/helpers/extensions.dart';
import 'package:my_suit/core/routing/routes.dart';
import 'package:my_suit/core/widgets/custom_circle_Icon.dart';
import 'package:my_suit/features/home/data/model/suit_model.dart';

class SuitCard extends StatelessWidget {
  final SuitModel suit;

  const SuitCard({super.key, required this.suit});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle suit card tap
        context.pushNamed(Routes.productdetails);
      },
      child: Stack(
        children: [
          Card(
            borderOnForeground: true,
            surfaceTintColor: Colors.white.withOpacity(0.8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: Image.network(
                      suit.image,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        suit.brand,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(suit.type),
                      Text(
                        '\$${suit.price.toStringAsFixed(0)}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 9,
            right: 6,
            child: CustomCircleIcon(icon: Icons.favorite_border, onTap: () {}),
          ),
        ],
      ),
    );
  }
}
