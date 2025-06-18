import 'package:flutter/material.dart';
import 'package:my_suit/features/Wishlist/ui/screen/wish_list_screen.dart';
import 'package:my_suit/features/auth/ui/screens/login_screen.dart';
import 'package:my_suit/features/auth/ui/screens/register_screen.dart';
import 'package:my_suit/features/category/ui/screen/category_screen.dart';
import 'package:my_suit/features/home/data/model/suit_model.dart';
import 'package:my_suit/features/home/ui/screen/home_screen.dart';
import 'package:my_suit/features/onboarding/ui/onboarding_screen.dart';
import 'package:my_suit/features/product_details/ui/screen/product_details_screen.dart';
import 'package:my_suit/features/profile/ui/screen/profile_screen.dart';
import 'package:my_suit/features/purchase/ui/screen/purchase_screen.dart';
import 'package:my_suit/features/rental/ui/screen/rental_screen.dart';
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
      case Routes.wishlist:
        return MaterialPageRoute(builder: (_) => WishListScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.categorydetails:
        return MaterialPageRoute(builder: (_) => CategoryScreen());
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case Routes.purchaseScreen:
        final suit = settings.arguments as SuitModel;
        return MaterialPageRoute(builder: (_) => PurchaseScreen(suit: suit));
      case Routes.rental:
        final suit = settings.arguments as SuitModel;
        return MaterialPageRoute(builder: (_) => RentalScreen(suit: suit));

      case Routes.productdetails:
        if (settings.arguments is SuitModel) {
          final suit = settings.arguments as SuitModel;
          return MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(suit: suit),
          );
        }
        return null;

      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text("No Route Found"))),
        );
    }
  }
}
