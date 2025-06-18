import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_suit/core/helpers/extensions.dart';
import 'package:my_suit/core/localization/locale_keys.dart';
import 'package:my_suit/core/theming/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onMenuTap;

  const CustomAppBar({super.key, required this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';

    return AppBar(
      backgroundColor: Colors.black,
      elevation: 2,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.white),
        onPressed: onMenuTap,
      ),
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            "assets/images/png/logo.png",
            width: 36.w,
            height: 36.h,
            fit: BoxFit.contain,
          ),
          12.0.width,
          Text(
            LocaleKeys.appname.tr(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Styles.font20W600.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),

          36.w.width, // space equal to logo on the left
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
