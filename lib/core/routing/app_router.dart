import 'package:flutter/material.dart';
import 'package:my_suit/features/auth/ui/screens/login_screen.dart';
import 'package:my_suit/features/auth/ui/screens/register_screen.dart';
import 'package:my_suit/features/home/ui/screen/home_screen.dart';
import 'package:my_suit/features/onboarding/ui/onboarding_screen.dart';
import 'package:my_suit/features/product_details/ui/product_details_screen.dart';
import 'package:my_suit/features/splash/ui/screens/splash_screen.dart';
import 'package:my_suit/layout/main_layout.dart';

import 'routes.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.layout:
        return MaterialPageRoute(builder: (_) => const MainLayout());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.productdetails:
        return MaterialPageRoute(builder: (_) => const ProductDetailsScreen());

      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text("No Route Found"))),
        );
    }
  }
}
