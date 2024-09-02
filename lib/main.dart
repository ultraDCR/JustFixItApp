import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_fix_it/data/network_service.dart';
import 'package:just_fix_it/data/repositories/auth_repository.dart';

import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  var _networkServices = NetworkService.instance;
  var _authRepository = AuthRepository(networkService: _networkServices);

  runApp(MyApp(authRepository: _authRepository));

}



class MyApp extends StatefulWidget {
  final AuthRepository authRepository;


  const MyApp(
      {Key? key,
        required this.authRepository,
       })
      : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>.value(
          value: widget.authRepository,
        ),

      ],
      child: MaterialApp(
        // navigatorObservers: [
        // ],
        // navigatorKey: navigatorKey,
        // supportedLocales: const [
        //   Locale('en', 'US'),
        //   Locale('ne', 'NP'),
        // ],

        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: AppRouter.home,
        onGenerateRoute: AppRouter.onGenerateRoute,
        onGenerateInitialRoutes: (String initialRouteName) {
          return [
            AppRouter.onGenerateRoute(
              RouteSettings(
                  name: initialRouteName,
              ),
            )
          ];
        }, // home: const MyHomePage(title: 'ForeverYng'),
      ),
    );
  }
}

