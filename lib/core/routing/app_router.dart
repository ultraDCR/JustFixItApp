import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_fix_it/data/repositories/auth_repository.dart';
import 'package:just_fix_it/domain/cubit/auth/login/login_cubit.dart';
import 'package:just_fix_it/login_page.dart';
import 'package:just_fix_it/presentation/home/dashboard_page.dart';
import 'package:just_fix_it/presentation/home/home_page.dart';
import 'package:just_fix_it/presentation/login/login_screen.dart';
import 'package:just_fix_it/presentation/register/register_page.dart';
import 'package:just_fix_it/presentation/searvice_search/searvice_search_page.dart';
import 'package:just_fix_it/presentation/service_details/service_details_screen.dart';
import 'package:just_fix_it/presentation/service_list/service_list_page.dart';
import 'package:just_fix_it/presentation/service_request_history/service_request_history_page.dart';
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
  static const String serviceSearch = '/service_search';
  static const String serviceList = '/service_list';
  static const String serviceHistory = '/service_history';

  const AppRouter._();

  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case home:
        var arg = routeSettings.arguments as Uri?;
        return MaterialPageRoute(
            builder: (context) => const DashboardPage(),
            settings: const RouteSettings(name: home));
      case login:
        var arg = routeSettings.arguments as Uri?;
        return MaterialPageRoute(
            builder: (context) =>  BlocProvider(create: (_) => LoginCubit(authRepository: context.read<AuthRepository>()), child: LoginScreen()),
            settings: const RouteSettings(name: login));
      case signup:
        var arg = routeSettings.arguments as Uri?;
        return MaterialPageRoute(
            builder: (context) =>  RegisterPage(),
            settings: const RouteSettings(name: signup));

      case serviceDetails:
        var arg = routeSettings.arguments as Uri?;
        return MaterialPageRoute(
            builder: (context) => ServiceDetailsScreen(),
            settings: const RouteSettings(name: serviceDetails));

      case serviceSearch:
        var arg = routeSettings.arguments as Uri?;
        return MaterialPageRoute(
            builder: (context) => ServiceSearchPage(),
            settings: const RouteSettings(name: serviceSearch));

      case serviceList:
        var arg = routeSettings.arguments as Uri?;
        return MaterialPageRoute(
            builder: (context) => ServiceListPage(),
            settings: const RouteSettings(name: serviceList));

      case serviceHistory:
        var arg = routeSettings.arguments as Uri?;
        return MaterialPageRoute(
            builder: (context) => RequestHistoryPage(),
            settings: const RouteSettings(name: serviceHistory));
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
