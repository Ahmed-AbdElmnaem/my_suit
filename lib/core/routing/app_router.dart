import 'package:flutter/material.dart';
import 'package:my_suit/features/auth/ui/screens/login_screen.dart';
import 'package:my_suit/features/auth/ui/screens/register_screen.dart';
import 'package:my_suit/features/onboarding/ui/onboarding_screen.dart';
import 'package:my_suit/features/splash/ui/screens/splash_screen.dart';

import 'routes.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text("No Route Found"))),
        );
    }
  }
}
