import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:my_suit/core/helpers/extensions.dart';
import 'package:my_suit/core/theming/styles.dart';
import 'package:my_suit/core/widgets/custom_button.dart';
import 'package:my_suit/features/home/data/model/suit_model.dart';
import 'package:my_suit/features/product_details/ui/widgets/image_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RentalScreen extends StatefulWidget {
  final SuitModel suit;

  const RentalScreen({super.key, required this.suit});

  @override
  State<RentalScreen> createState() => _RentalScreenState();
}

class _RentalScreenState extends State<RentalScreen> {
  late final List<String> images;
  final pageController = PageController();
  int rentalDays = 1;
  DateTime startDate = DateTime.now();

  double get rentalPricePerDay => widget.suit.price * 0.12;
  double get totalPrice => rentalPricePerDay * rentalDays;

  @override
  void initState() {
    super.initState();
    images = [widget.suit.image];
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Colors.black,
              onPrimary: Colors.white,
              surface: Colors.black,
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != startDate) {
      setState(() => startDate = picked);
    }
  }

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
                  height: 350,
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
                      20.0.height,
                      _buildDatePicker(context),
                      20.0.height,
                      _buildRentalDaysSelector(),
                      20.0.height,
                      _buildPriceSummary(),
                      30.0.height,
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: CustomButton(
                          icon: Icons.check_circle_outline,
                          backgroundColor: Colors.black,
                          text: 'Confirm Rental',
                          textColor: Colors.white,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Rental Confirmed for $rentalDays day(s) starting ${DateFormat.yMMMd().format(startDate)}',
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

  Widget _buildDatePicker(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectStartDate(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Start Date: ${DateFormat.yMMMd().format(startDate)}',
              style: Styles.font16W500.copyWith(color: Colors.white),
            ),
            const Icon(Icons.calendar_today, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildRentalDaysSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Rental Duration (days):',
          style: Styles.font16W500.copyWith(color: Colors.black),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                if (rentalDays > 1) {
                  setState(() => rentalDays--);
                }
              },
              icon: const Icon(
                Icons.remove_circle_outline,
                color: Colors.white,
              ),
            ),
            Text(
              '$rentalDays',
              style: Styles.font16W500.copyWith(color: Colors.black),
            ),
            IconButton(
              onPressed: () => setState(() => rentalDays++),
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
              'Price per day:',
              style: Styles.font16W500.copyWith(color: Colors.black87),
            ),
            Text(
              'EGP ${rentalPricePerDay.toStringAsFixed(0)}',
              style: Styles.font16W500.copyWith(color: Colors.black),
            ),
          ],
        ),
        10.0.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Price:',
              style: Styles.font18W400.copyWith(color: Colors.black87),
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
