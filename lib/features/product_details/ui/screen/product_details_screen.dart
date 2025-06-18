import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_suit/core/helpers/extensions.dart';
import 'package:my_suit/core/localization/locale_keys.dart';
import 'package:my_suit/core/routing/routes.dart';
import 'package:my_suit/core/theming/styles.dart';
import 'package:my_suit/core/widgets/custom_button.dart';
import 'package:my_suit/core/widgets/custom_circle_Icon.dart';
import 'package:my_suit/features/product_details/ui/widgets/color_selector.dart';
import 'package:my_suit/features/product_details/ui/widgets/image_slider.dart';
import 'package:my_suit/features/product_details/ui/widgets/size_selector.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../home/data/model/suit_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.suit});

  final SuitModel suit;

  @override
  Widget build(BuildContext context) {
    final colors = [Colors.black, Colors.brown, Colors.blueGrey];
    final sizes = ['S', 'M', 'L', 'XL'];
    final images = [
      suit.image,
    ]; // If multiple images exist, extend model later.
    final pageController = PageController();

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 380,
                width: double.infinity,
                child: ImageSlider(images: images, controller: pageController),
              ),
              Positioned(
                top: 40,
                left: 16,
                child: CustomCircleIcon(
                  size: 30,
                  color: Colors.white,
                  icon: Icons.arrow_back_ios_new,
                  onTap: () => Navigator.pop(context),
                ),
              ),
              Positioned(
                top: 40,
                right: 16,
                child: CustomCircleIcon(
                  color: suit.isFavorite ? Colors.red : Colors.grey,
                  size: 30,
                  icon:
                      suit.isFavorite ? Icons.favorite : Icons.favorite_border,
                  onTap: () {},
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: images.length,
                    effect: const WormEffect(
                      activeDotColor: Colors.white,
                      dotColor: Colors.white54,
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(suit.name, style: Styles.font20W600),
                    8.0.height,
                    Text(suit.brand, style: Styles.font14W400),
                    12.0.height,
                    Text(
                      'EGP ${suit.price}',
                      style: Styles.font20W600.copyWith(color: Colors.black),
                    ),
                    10.0.height,
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 18,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          LocaleKeys.rental_price.tr(
                            namedArgs: {
                              'price': (suit.price * 0.12).toStringAsFixed(0),
                            },
                          ),
                          style: Styles.font14W400.copyWith(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    16.0.height,
                    Text(
                      suit.type,
                      style: Styles.font14W400.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    23.0.height,
                    Text(
                      LocaleKeys.select_color.tr(),
                      style: Styles.font16W500,
                    ),
                    9.0.height,
                    ColorSelector(colors: colors),
                    25.0.height,
                    Text(LocaleKeys.select_size.tr(), style: Styles.font16W500),
                    8.0.height,
                    SizeSelector(sizes: sizes),
                    25.0.height,
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            icon: Icons.shopping_bag_outlined,
                            backgroundColor: Colors.black,
                            text: LocaleKeys.buy_now.tr(),
                            textColor: Colors.white,
                            onPressed: () {
                              context.pushNamed(
                                Routes.purchaseScreen,
                                arguments: suit,
                              );
                            },
                          ),
                        ),
                        12.0.width,
                        Expanded(
                          child: CustomButton(
                            icon: Icons.calendar_month_outlined,
                            backgroundColor: Colors.grey.shade700,
                            text: LocaleKeys.rent_now.tr(),
                            textColor: Colors.white,
                            onPressed: () {
                              context.pushNamed(Routes.rental, arguments: suit);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
