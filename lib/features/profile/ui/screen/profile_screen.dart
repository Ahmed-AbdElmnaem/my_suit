import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:my_suit/core/helpers/extensions.dart';
import 'package:my_suit/core/localization/locale_keys.dart';
import 'package:my_suit/core/routing/routes.dart';
import 'package:my_suit/core/theming/styles.dart';
import 'package:my_suit/features/profile/ui/widgets/custom_circle_image.dart';
import 'package:my_suit/features/profile/ui/widgets/profile_menu_Item%20.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              45.0.height,
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 60),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 80,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[900]!.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black.withOpacity(0.2)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Ahmed AbdElmanem',
                              style: Styles.font20W600.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        8.0.height,
                        Text(
                          'ahmed@yahoo.com',
                          style: Styles.font16W500.copyWith(
                            color: Colors.grey[300],
                          ),
                        ),
                        30.0.height,
                        _buildAnimatedMenuItems(context),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      PickableCircleImage(
                        placeholderUrl:
                            'https://t3.ftcdn.net/jpg/07/24/59/76/360_F_724597608_pmo5BsVumFcFyHJKlASG2Y2KpkkfiYUU.jpg',
                        radius: 60,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedMenuItems(BuildContext context) {
    final items = [
      ProfileMenuItem(
        icon: Icons.person,
        title: LocaleKeys.my_account.tr(),
        onTap: () {},
        textColor: Colors.white,
        iconColor: Colors.white,
      ),
      ProfileMenuItem(
        icon: Icons.favorite,
        title: LocaleKeys.wishlist.tr(),
        onTap: () => context.pushNamed(Routes.wishlist),
        textColor: Colors.white,
        iconColor: Colors.white,
      ),
      ProfileMenuItem(
        icon: Icons.settings,
        title: LocaleKeys.settings.tr(),
        onTap: () {},
        textColor: Colors.white,
        iconColor: Colors.white,
      ),
      ProfileMenuItem(
        icon: Icons.logout,
        title: LocaleKeys.logout.tr(),
        onTap: () {},
        textColor: Colors.white,
        iconColor: Colors.white,
      ),
    ];

    return AnimationLimiter(
      child: Column(
        children: List.generate(
          items.length,
          (index) => AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 100),
            child: SlideAnimation(
              horizontalOffset: 50.0,
              duration: const Duration(milliseconds: 500),
              child: FadeInAnimation(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: items[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
