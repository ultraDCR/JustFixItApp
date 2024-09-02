import 'package:flutter/material.dart';
import 'package:just_fix_it/presentation/home/dashboard_page.dart';
import 'package:just_fix_it/presentation/home/home_page.dart';
import 'package:just_fix_it/presentation/service_details/service_details_screen.dart';
import 'package:just_fix_it/shared/exceptions/route_exception.dart';


class AppRouter {
  static const String home = 'home';
  static const String splash = 'splash';
  static const String category = '/category';
  static const String auth = '/auth';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgetPassword = '/forget_password';
  static const String notification = '/notification';
  static const String search = '/search';
  static const String changePassword = '/change_password';
  static const String termsAndConditions = '/terms_and_conditions';
  static const String faq = '/faq';
  static const String contactUs = '/contact_us';
  static const String myReview = '/my_review';
  static const String serviceDetails = '/service_details';

  const AppRouter._();

  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case home:
        var arg = routeSettings.arguments as Uri?;
        return MaterialPageRoute(
            builder: (context) => const DashboardPage(),
            settings: const RouteSettings(name: home));

      case serviceDetails:
        var arg = routeSettings.arguments as Uri?;
        return MaterialPageRoute(
            builder: (context) => ServiceDetailsScreen(),
            settings: const RouteSettings(name: serviceDetails));
      // case splash:
      //   var arg = routeSettings.arguments as Uri?;
      //   // if (kDebugMode) {
      //   //   print("splash : ${arg}");
      //   // }
      //   return MaterialPageRoute(
      //       builder: (context) => SplashPage(dynamicLink: arg));

      default:
        throw const RouteException("Route not found");
    }
  }
}
