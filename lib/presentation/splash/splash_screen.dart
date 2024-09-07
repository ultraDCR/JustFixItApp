import 'package:flutter/material.dart';
import 'package:just_fix_it/core/routing/app_router.dart';
import 'package:just_fix_it/presentation/home/service_item_view.dart';

import '../../domain/preference/share_preference_util.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    //set time to load the new page
    Future.delayed(const Duration(milliseconds: 2000), () async {
      var token =  await SharePreferenceUtils().getToken();
      var userType =  await SharePreferenceUtils().getUserType();

      if(token.isNotEmpty){
        print("usertype:$userType");
        if(userType == "provider"){
          Navigator.pushReplacementNamed(context,AppRouter.providerDashboard);
        }else{
          Navigator.pushReplacementNamed(context,AppRouter.home);
        }
      }else{
        Navigator.pushReplacementNamed(context,AppRouter.login);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ImageItem(image:"")
      ),
    );
  }
}
