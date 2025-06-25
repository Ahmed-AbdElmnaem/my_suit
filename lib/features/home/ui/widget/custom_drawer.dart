import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_suit/core/helpers/extensions.dart';
import 'package:my_suit/core/localization/locale_keys.dart';
import 'package:my_suit/core/routing/routes.dart';

class CustomDrawer extends StatelessWidget {
  final void Function(String route)? onNavigate;

  const CustomDrawer({super.key, this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final isEnglish = context.locale.languageCode == 'en';

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            const Divider(thickness: 1),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  _buildTile(
                    context,
                    icon: Icons.home,
                    title: LocaleKeys.home.tr(),
                    onTap: () => Navigator.pop(context),
                  ),
                  _buildTile(
                    context,
                    icon: Icons.category,
                    title: LocaleKeys.categories.tr(),
                    onTap: () => context.pushNamed(Routes.category),
                  ),
                  _buildTile(
                    context,
                    icon: Icons.favorite_border,
                    title: LocaleKeys.wishlist.tr(),
                    onTap: () => context.pushNamed(Routes.wishlist),
                  ),
                  _buildTile(
                    context,
                    icon: Icons.shopping_cart,
                    title: LocaleKeys.cart.tr(),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.language),
                    title: Text(LocaleKeys.change_language.tr()),
                    trailing: Text(isEnglish ? '🇺🇸' : '🇪🇬'),

                    onTap: () {
                      context.setLocale(
                        isEnglish ? const Locale('ar') : const Locale('en'),
                      );
                    },
                  ),
                  const Divider(thickness: 1),
                  _buildTile(
                    context,
                    icon: Icons.logout,
                    title: LocaleKeys.logout.tr(),
                    onTap: () {
                      Navigator.pop(context);
                      // هنا تحط منطق تسجيل الخروج
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      alignment: Alignment.center,
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl:
                'https://i.pinimg.com/736x/e1/2d/07/e12d07981ec3276d384b9ad5ebef46c3.jpg',

            imageBuilder:
                (context, imageProvider) =>
                    CircleAvatar(radius: 40, backgroundImage: imageProvider),
            placeholder:
                (context, url) => const CircleAvatar(
                  radius: 40,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
            errorWidget:
                (context, url, error) => const CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.error, size: 40),
                ),
          ),
          const SizedBox(height: 12),
          Text(
            'Ahmed Abdelmnaem',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            'ahmed@example.com',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      hoverColor: Colors.grey.withOpacity(0.1),
    );
  }
}
