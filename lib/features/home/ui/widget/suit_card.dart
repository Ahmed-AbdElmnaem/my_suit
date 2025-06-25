import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_suit/core/helpers/extensions.dart';
import 'package:my_suit/core/localization/locale_keys.dart';
import 'package:my_suit/core/routing/routes.dart';
import 'package:my_suit/core/theming/styles.dart';
import 'package:my_suit/core/widgets/custom_circle_Icon.dart';
import 'package:my_suit/features/home/data/model/suit_model.dart';

class SuitCard extends StatefulWidget {
  final SuitModel suit;
  final bool addToCart;

  const SuitCard({super.key, required this.suit, required this.addToCart});

  @override
  State<SuitCard> createState() => _SuitCardState();
}

class _SuitCardState extends State<SuitCard> {
  late SuitModel suit;

  @override
  void initState() {
    super.initState();
    suit = widget.suit;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.productdetails, arguments: suit);
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
                    child: CachedNetworkImage(
                      imageUrl: suit.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      placeholder:
                          (context, url) => const Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                      errorWidget:
                          (context, url, error) => const Icon(
                            Icons.broken_image,
                            color: Colors.grey,
                          ),
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
                      if (widget.addToCart == true)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                LocaleKeys.add_to_cart.tr(),
                                style: Styles.font16W500.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
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
            child: CustomCircleIcon(
              size: 30,
              icon: suit.isFavorite ? Icons.favorite : Icons.favorite_border,
              onTap: () {
                setState(() {
                  suit = suit.copyWith(isFavorite: !suit.isFavorite);
                });
                log('Suit ${suit.name} favorite status: ${suit.isFavorite}');
              },
              color:
                  suit.isFavorite ? Colors.red : Colors.grey.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}
