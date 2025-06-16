import 'package:flutter/material.dart';
import 'package:my_suit/core/helpers/extensions.dart';
import 'package:my_suit/core/theming/styles.dart';
import 'package:my_suit/core/widgets/custom_button.dart';
import 'package:my_suit/features/product_details/ui/widgets/color_selector.dart';
import 'package:my_suit/features/product_details/ui/widgets/image_slider.dart';
import 'package:my_suit/features/product_details/ui/widgets/size_selector.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [Colors.black, Colors.brown, Colors.blueGrey];
    final sizes = ['S', 'M', 'L', 'XL'];
    final images = [
      'https://i.pinimg.com/736x/5d/36/ab/5d36ab81838f9debbbc6035b44327e1c.jpg',
      'https://i.pinimg.com/736x/bf/e9/28/bfe928a68fd3fee348909f1bdf6d5419.jpg',
    ];
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

              // Back button
              Positioned(
                top: 40,
                left: 16,
                child: _circleIcon(
                  icon: Icons.arrow_back_ios_new,
                  onTap: () => Navigator.pop(context),
                ),
              ),

              // Favorite icon
              Positioned(
                top: 40,
                right: 16,
                child: _circleIcon(icon: Icons.favorite_border, onTap: () {}),
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
                    onDotClicked: (index) {
                      pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),

          // Bottom content
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
                    Text('2-Piece Slim Fit Suit', style: Styles.font20W600),
                    const SizedBox(height: 8),

                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 20),
                        6.0.height,
                        Text('4.5', style: Styles.font14W400),
                        const SizedBox(width: 6),
                        Text(
                          '(210 reviews)',
                          style: Styles.font14W400.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                    12.0.height,
                    Text(
                      'EGP 2,990',
                      style: Styles.font20W600.copyWith(color: Colors.brown),
                    ),
                    16.0.height,

                    Text(
                      'A classy slim fit suit perfect for formal occasions.',
                      style: Styles.font14W400.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    23.0.height,
                    Text('Select Color', style: Styles.font16W500),
                    9.0.height,
                    ColorSelector(colors: colors),
                    25.0.height,
                    Text('Select Size', style: Styles.font16W500),
                    8.0.height,
                    SizeSelector(sizes: sizes),
                    25.0.height,
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: CustomButton(
                        icon: Icons.shopping_cart_outlined,
                        backgroundColor: Colors.black,
                        text: 'Add to Cart',
                        textColor: Colors.white,
                        onPressed: () {
                          // Handle add to cart action
                        },
                      ),
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

  Widget _circleIcon({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black54,
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}
