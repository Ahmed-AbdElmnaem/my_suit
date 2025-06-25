import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:my_suit/core/helpers/extensions.dart';
import 'package:my_suit/core/theming/styles.dart';
import 'package:my_suit/core/widgets/custom_button.dart';
import 'package:my_suit/features/home/data/model/suit_model.dart';
import 'package:my_suit/features/product_details/ui/widgets/image_slider.dart';
import 'package:my_suit/features/rental/logic/cubit/rental_cubit.dart';
import 'package:my_suit/features/rental/logic/cubit/rental_state.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/localization/locale_keys.dart';

class RentalScreen extends StatelessWidget {
  final SuitModel suit;
  final pageController = PageController();

  final Color selectedColor;
  final String selectedSize;

  RentalScreen({
    super.key,
    required this.suit,
    required this.selectedColor,
    required this.selectedSize,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RentalCubit(suitPrice: suit.price),
      child: BlocBuilder<RentalCubit, RentalState>(
        builder: (context, state) {
          final cubit = context.read<RentalCubit>();
          final images = [suit.image];

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
                              suit.name,
                              style: Styles.font20W600.copyWith(
                                color: Colors.black,
                              ),
                            ),
                            6.0.height,
                            Text(
                              suit.brand,
                              style: Styles.font16W500.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                            6.0.height,
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
                            GestureDetector(
                              onTap: () => cubit.selectStartDate(context),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 16,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${LocaleKeys.start_date.tr()} ${cubit.formattedDate}',
                                      style: Styles.font16W500.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            20.0.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  LocaleKeys.rental_duration.tr(),
                                  style: Styles.font16W500.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: cubit.decreaseDays,
                                      icon: const Icon(
                                        Icons.remove_circle_outline,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      '${state.rentalDays}',
                                      style: Styles.font16W500.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: cubit.increaseDays,
                                      icon: const Icon(
                                        Icons.add_circle_outline,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            20.0.height,
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      LocaleKeys.price_per_day.tr(),
                                      style: Styles.font16W500.copyWith(
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      'EGP ${state.rentalPricePerDay.toStringAsFixed(0)}',
                                      style: Styles.font16W500.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                10.0.height,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      LocaleKeys.total_price.tr(),
                                      style: Styles.font18W400.copyWith(
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      'EGP ${cubit.totalPrice.toStringAsFixed(0)}',
                                      style: Styles.font18W400.copyWith(
                                        color: Colors.greenAccent,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            30.0.height,
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: CustomButton(
                                icon: Icons.check_circle_outline,
                                backgroundColor: Colors.black,
                                text: LocaleKeys.confirm_rental.tr(),
                                textColor: Colors.white,
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        '${LocaleKeys.rental_confirmed.tr()} ${state.rentalDays} ${LocaleKeys.days.tr()} - ${cubit.formattedDate}',
                                      ),
                                      backgroundColor: Colors.black,
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
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
        },
      ),
    );
  }
}
