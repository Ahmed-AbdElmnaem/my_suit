import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_suit/core/routing/app_router.dart';
import 'package:my_suit/core/routing/routes.dart';

class MySuit extends StatelessWidget {
  const MySuit({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        fontFamily: 'Urbanist',
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.onGenerateRoute,
      initialRoute: Routes.splash,
      builder: (context, widget) {
        ScreenUtil.init(context);
        return Directionality(textDirection: TextDirection.rtl, child: widget!);
      },
    );
  }
}
