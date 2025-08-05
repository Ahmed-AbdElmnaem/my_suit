import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:my_suit/core/helpers/extensions.dart';
import 'package:my_suit/core/localization/locale_keys.dart';
import 'package:my_suit/core/theming/styles.dart';
import 'package:my_suit/core/widgets/custom_button.dart';
import 'package:my_suit/features/home/data/model/suit_model.dart';
import 'package:my_suit/features/product_details/ui/widgets/image_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PurchaseScreen extends StatefulWidget {
  final SuitModel suit;
  final Color selectedColor;
  final String selectedSize;

  const PurchaseScreen({
    super.key,
    required this.suit,
    required this.selectedColor,
    required this.selectedSize,
  });

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  late final List<String> images;
  final pageController = PageController();
  int quantity = 1;

  late final Color selectedColor = widget.selectedColor;
  late final String selectedSize = widget.selectedSize;

  @override
  void initState() {
    super.initState();
    images = [widget.suit.image];
  }

  double get totalPrice => widget.suit.price * quantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                SizedBox(
                  height: 380,
                  width: double.infinity,
                  child: ImageSlider(
                    images: images,
                    controller: pageController,
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
                        dotColor: Colors.black,
                        dotHeight: 10,
                        dotWidth: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: 20.0.height),
          SliverToBoxAdapter(
            child: AnimationLimiter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 500),
                    childAnimationBuilder:
                        (widget) => SlideAnimation(
                          verticalOffset: 50,
                          child: FadeInAnimation(child: widget),
                        ),
                    children: [
                      Text(
                        widget.suit.name,
                        style: Styles.font20W600.copyWith(color: Colors.black),
                      ),
                      6.0.height,
                      Text(
                        widget.suit.brand,
                        style: Styles.font16W500.copyWith(color: Colors.grey),
                      ),
                      8.0.height,
                      Row(
                        children: [
                          Text(
                            '${LocaleKeys.color.tr()}: ',
                            style: Styles.font16W500.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selectedColor,
                              border: Border.all(color: Colors.black26),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            '${LocaleKeys.size.tr()}: $selectedSize',
                            style: Styles.font16W500.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),

                      20.0.height,
                      _buildQuantitySelector(),
                      20.0.height,
                      _buildPriceSummary(),
                      30.0.height,
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: CustomButton(
                          icon: Icons.shopping_cart_checkout,
                          backgroundColor: Colors.black,
                          text: LocaleKeys.confirm_purchase.tr(),
                          textColor: Colors.white,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  LocaleKeys.purchase_confirmed.tr(
                                    namedArgs: {
                                      'quantity': '$quantity',
                                      'total':
                                          'EGP ${totalPrice.toStringAsFixed(0)}',
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      40.0.height,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          LocaleKeys.quantity.tr(),
          style: Styles.font16W500.copyWith(color: Colors.black),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                if (quantity > 1) setState(() => quantity--);
              },
              icon: const Icon(
                Icons.remove_circle_outline,
                color: Colors.black,
              ),
            ),
            Text(
              '$quantity',
              style: Styles.font16W500.copyWith(color: Colors.black),
            ),
            IconButton(
              onPressed: () => setState(() => quantity++),
              icon: const Icon(Icons.add_circle_outline, color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceSummary() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LocaleKeys.unit_price.tr(),
              style: Styles.font16W500.copyWith(color: Colors.black),
            ),
            Text(
              'EGP ${widget.suit.price.toStringAsFixed(0)}',
              style: Styles.font16W500.copyWith(color: Colors.black),
            ),
          ],
        ),
        10.0.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LocaleKeys.total_price.tr(),
              style: Styles.font18W400.copyWith(color: Colors.black),
            ),
            Text(
              'EGP ${totalPrice.toStringAsFixed(0)}',
              style: Styles.font18W400.copyWith(
                color: Colors.greenAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
