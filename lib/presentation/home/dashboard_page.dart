import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_fix_it/core/routing/app_router.dart';
import 'package:just_fix_it/data/repositories/auth_repository.dart';
import 'package:just_fix_it/data/repositories/service_repository.dart';
import 'package:just_fix_it/domain/cubit/home/home_cubit.dart';
import 'package:just_fix_it/domain/cubit/profile/profile_cubit.dart';
import 'package:just_fix_it/presentation/service/services_page.dart';
import 'package:just_fix_it/presentation/home/home_page.dart';
import 'package:just_fix_it/presentation/profile/profile_page.dart';
import 'package:just_fix_it/shared/components/gap.dart';
import 'package:just_fix_it/shared/extensions/context_extensions.dart';

class DashboardPage extends StatefulWidget {

  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Widget> pages = [
    const HomePage(),
    ServicesScreen(),
    ProfileScreen(),
  ];
  int pageSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar:  AppBar(
        title: Padding(
          padding: const EdgeInsets.only( left: 8.0,right: 8.0,bottom: 10,top: 20),
          child: Row(
            children: [
              Image.asset("assets/images/logo.png", width: 50,height: 50,),
              const Gap.horizontal(width: 10),
              Expanded(
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(
                        context,AppRouter.serviceSearch);
                  },
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      enabled: false,
                      style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                      decoration: InputDecoration(
                        prefixIcon:  Image.asset("assets/images/search.png"),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 68,
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
                top: BorderSide(
                    width: 2, color: Color(0xFFF1F1F1)))),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavItem(
              icon: 'assets/images/home.png',
              title: 'Home',
              onItemClick: () {
                print(pageSelected);
                setState(() {
                  pageSelected = 0;
                });
                print(pageSelected);

              },
              isSelected:pageSelected == 0,
            ),
            BottomNavItem(
              icon: 'assets/images/services.png',
              title: 'Services',
              onItemClick: () {
                print(pageSelected);

                setState(() {

                  pageSelected = 1;
                });
                print(pageSelected);

              },
              isSelected:pageSelected == 1,
            ),
            BottomNavItem(
              icon: 'assets/images/profile.png',
              title: 'Profile',
              onItemClick: () {
                print(pageSelected);

                setState(() {
                  pageSelected = 2;
                });
                print(pageSelected);

              },

              isSelected:pageSelected == 2,
            ),
          ],
        ),
      ),

      body:MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => HomeCubit(
                 serviceRepository: context.read<ServiceRepository>(),
              ),
            ),
            BlocProvider(
              create: (_) => ProfileCubit(
                 authRepository: context.read<AuthRepository>(),
              ),
            ),
          ],
      child: pages[pageSelected]),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    required this.icon,
    required this.onItemClick,
    required this.isSelected,
    required this.title,
    Key? key,
  }) : super(key: key);

  final String icon;

  final VoidCallback onItemClick;

  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () {
          onItemClick();
        },
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width / 5,
          height: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                icon,
                width: 44,
                height: 44,
                color: isSelected ? context.colorScheme.primary : context.colorScheme.secondary,
              ),
              const SizedBox(
                height: 10,
              ),
              // Text(
              //   title,
              //   style: TextStyle().copyWith(
              //       fontFamily: 'Inter',
              //       fontSize:
              //       (MediaQuery.of(context).size.width < 330) ? 12 : 14,
              //       fontWeight: FontWeight.w400,
              //       color: isSelected
              //           ? context.colorScheme.primary
              //           : const Color(0xFF46383C).withOpacity(0.71)),
              // ),
            ],
          ),
        ),
      );
    });
  }
}
