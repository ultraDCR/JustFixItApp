import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_fix_it/data/models/api_response/user.dart';
import 'package:just_fix_it/data/repositories/auth_repository.dart';
import 'package:just_fix_it/data/repositories/service_repository.dart';
import 'package:just_fix_it/domain/cubit/addService/add_service_cubit.dart';
import 'package:just_fix_it/domain/cubit/editProfile/edit_profile_cubit.dart';
import 'package:just_fix_it/domain/cubit/login/login_cubit.dart';
import 'package:just_fix_it/domain/cubit/providerServiceRequest/provider_service_request_cubit.dart';
import 'package:just_fix_it/domain/cubit/requestHistory/request_history_cubit.dart';
import 'package:just_fix_it/domain/cubit/searchService/search_service_cubit.dart';
import 'package:just_fix_it/domain/cubit/serviceDetails/service_details_cubit.dart';
import 'package:just_fix_it/domain/cubit/signup/signup_bloc.dart';
import 'package:just_fix_it/presentation/edit_profile/edit_profile_page.dart';
import 'package:just_fix_it/presentation/home/dashboard_page.dart';
import 'package:just_fix_it/presentation/home/home_page.dart';
import 'package:just_fix_it/presentation/login/login_screen.dart';
import 'package:just_fix_it/presentation/profile/faq/faq_page.dart';
import 'package:just_fix_it/presentation/profile/support/support_page.dart';
import 'package:just_fix_it/presentation/profile/terms/terms_and_conditions_page.dart';
import 'package:just_fix_it/presentation/provider/providerCreateService/provider_create_service.dart';
import 'package:just_fix_it/presentation/provider/providerDashboard/provider_dashboard_page.dart';
import 'package:just_fix_it/presentation/provider/providerRequest/provider_request_page.dart';
import 'package:just_fix_it/presentation/provider/providerServices/provider_services_page.dart';
import 'package:just_fix_it/presentation/register/register_page.dart';
import 'package:just_fix_it/presentation/service_details/service_details_screen.dart';
import 'package:just_fix_it/presentation/service_list/service_list_page.dart';
import 'package:just_fix_it/presentation/service_request_history/service_request_history_page.dart';
import 'package:just_fix_it/presentation/service_search/service_search_page.dart';
import 'package:just_fix_it/presentation/splash/splash_screen.dart';
import 'package:just_fix_it/shared/exceptions/route_exception.dart';

import '../../data/models/api_response/service.dart';

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
  static const String support = '/support';
  static const String contactUs = '/contact_us';
  static const String myReview = '/my_review';
  static const String serviceDetails = '/service_details';
  static const String serviceSearch = '/service_search';
  static const String serviceList = '/service_list';
  static const String serviceHistory = '/service_history';
  static const String providerDashboard = 'provider_Dashboard';
  static const String providerRequests = 'provider_requests';
  static const String providerServices = 'provider_services';
  static const String editProfile = 'edit_profile';
  static const String createService = 'create_service';

  const AppRouter._();

  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case faq:
        return MaterialPageRoute(builder: (context) => const FaqPage());

      case support:
        return MaterialPageRoute(builder: (context) => SupportPage());
      case termsAndConditions:
        return MaterialPageRoute(
            builder: (context) => const TermsAndConditionsPage());
      case home:
        var arg = routeSettings.arguments as Uri?;
        return MaterialPageRoute(
            builder: (context) => const DashboardPage(),
            settings: const RouteSettings(name: home));
      case login:
        var arg = routeSettings.arguments as Uri?;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (_) =>
                    LoginCubit(authRepository: context.read<AuthRepository>()),
                child: LoginScreen()),
            settings: const RouteSettings(name: login));
      case signup:
        var arg = routeSettings.arguments as Uri?;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (_) => SignupBloc(context.read<AuthRepository>()),
                child: RegisterPage()),
            settings: const RouteSettings(name: signup));

      case serviceDetails:
        var arg = routeSettings.arguments as dynamic;
        var service = Service.fromJson(arg);
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ServiceDetailsCubit(
                      serviceRepository: context.read<ServiceRepository>()),
                  child: ServiceDetailsScreen(service),
                ),
            settings: const RouteSettings(name: serviceDetails));

      case serviceSearch:
        var arg = routeSettings.arguments as Uri?;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => SearchServiceCubit(
                      serviceRepository: context.read<ServiceRepository>()),
                  child: ServiceSearchPage(),
                ),
            settings: const RouteSettings(name: serviceSearch));

      case serviceList:
        var serviceType = routeSettings.arguments as String?;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => SearchServiceCubit(
                      serviceRepository: context.read<ServiceRepository>()),
                  child: ServiceListPage(serviceType),
                ),
            settings: const RouteSettings(name: serviceList));

      case serviceHistory:
        var arg = routeSettings.arguments as Uri?;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => RequestHistoryCubit(
                      serviceRepository: context.read<ServiceRepository>()),
                  child: RequestHistoryPage(),
                ),
            settings: const RouteSettings(name: serviceHistory));

      //ProviderRoutes
      case providerDashboard:
        var arg = routeSettings.arguments as Uri?;
        return MaterialPageRoute(
            builder: (context) => ProviderDashboardPage(),
            settings: const RouteSettings(name: providerDashboard));
      case providerRequests:
        var arg = routeSettings.arguments as Uri?;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ProviderServiceRequestCubit(
                      serviceRepository: context.read<ServiceRepository>()),
                  child: ProviderRequestPage(),
                ),
            settings: const RouteSettings(name: providerRequests));
      case providerServices:
        var arg = routeSettings.arguments as Uri?;
        return MaterialPageRoute(
            builder: (context) => ProviderServicesPage(),
            settings: const RouteSettings(name: providerServices));

      case editProfile:
        var arg = routeSettings.arguments as dynamic;
        var user = User.fromJson(arg);
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => EditProfileCubit(
                      authRepository: context.read<AuthRepository>()),
                  child: EditProfilePage(
                    user: user,
                  ),
                ),
            settings: const RouteSettings(name: editProfile));

      case createService:
        var arg = routeSettings.arguments as Uri?;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => AddServiceCubit(
                      serviceRepository: context.read<ServiceRepository>()),
                  child: const ProviderCreateServicePage(),
                ),
            settings: const RouteSettings(name: createService));

      default:
        throw const RouteException("Route not found");
    }
  }
}
