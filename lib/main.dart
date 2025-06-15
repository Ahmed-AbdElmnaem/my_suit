import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_suit/core/routing/app_router.dart';
import 'package:my_suit/my_suit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(MySuit(appRouter: AppRouter()));
}
