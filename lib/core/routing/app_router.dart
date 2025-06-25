import 'package:flutter/material.dart';
import 'package:my_suit/features/Wishlist/ui/screen/wish_list_screen.dart';
import 'package:my_suit/features/auth/ui/screens/login_screen.dart';
import 'package:my_suit/features/auth/ui/screens/register_screen.dart';
import 'package:my_suit/features/category/ui/screen/category_details_screen.dart';
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
      case Routes.category:
        return MaterialPageRoute(builder: (_) => CategoryScreen());
      case Routes.categoryDetails:
        final args = settings.arguments as Map<String, dynamic>;
        final title = args['title'] as String;
        final products = args['products'] as List<SuitModel>;
        return MaterialPageRoute(
          builder:
              (_) => CategoryDetailsScreen(
                categoryTitle: title,
                products: products,
              ),
        );
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case Routes.purchaseScreen:
        final args = settings.arguments as Map<String, Object>;
        final suit = args['suit'] as SuitModel;
        final selectedColor = args['selectedColor'] as Color;
        final selectedSize = args['selectedSize'] as String;

        return MaterialPageRoute(
          builder:
              (_) => PurchaseScreen(
                suit: suit,
                selectedColor: selectedColor,
                selectedSize: selectedSize,
              ),
        );
      case Routes.rental:
        final args = settings.arguments as Map<String, Object>;
        final suit = args['suit'] as SuitModel;
        final selectedColor = args['selectedColor'] as Color;
        final selectedSize = args['selectedSize'] as String;

        return MaterialPageRoute(
          builder:
              (_) => RentalScreen(
                suit: suit,
                selectedColor: selectedColor,
                selectedSize: selectedSize,
              ),
        );

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
