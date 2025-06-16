import 'package:flutter/material.dart';
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
                child: PageView(
                  controller: pageController,
                  children: const [
                    ImageSlider(
                      images: [
                        'https://i.pinimg.com/736x/5d/36/ab/5d36ab81838f9debbbc6035b44327e1c.jpg',
                        'https://i.pinimg.com/736x/bf/e9/28/bfe928a68fd3fee348909f1bdf6d5419.jpg',
                      ],
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 40,
                left: 16,
                child: _circleIcon(
                  icon: Icons.arrow_back_ios_new,
                  onTap: () => Navigator.pop(context),
                ),
              ),

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
                    count: 2,
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
                    const Text(
                      '2-Piece Slim Fit Suit',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),

                    Row(
                      children: const [
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        SizedBox(width: 4),
                        Text('4.5', style: TextStyle(fontSize: 14)),
                        SizedBox(width: 6),
                        Text(
                          '(210 reviews)',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    const Text(
                      'EGP 2,990',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.brown,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // 🎨 Color
                    const Text(
                      'Select Color',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ColorSelector(colors: colors),
                    const SizedBox(height: 24),

                    // 📏 Size
                    const Text(
                      'Select Size',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizeSelector(sizes: sizes),
                    const SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown.shade700,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_shopping_cart_rounded,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Add to Cart',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
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
