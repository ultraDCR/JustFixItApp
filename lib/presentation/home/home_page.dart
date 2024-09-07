import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_fix_it/core/routing/app_router.dart';
import 'package:just_fix_it/presentation/home/service_item_view.dart';

import '../../domain/cubit/home/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Services> services = [
    Services(name: "Plumbing", icon: 'assets/images/plumbing.png'),
    Services(name: "Electricity", icon: 'assets/images/electric.png'),
    Services(name: "Cleaning", icon: 'assets/images/cleaning.png'),
   ];
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return context.read<HomeCubit>().fetchServices();
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.blueGrey,
              margin: const EdgeInsets.all(10),
              child: Image.asset("assets/images/cleaning_1.png"),
            ),
            const Text("Services", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...services.map(
                      (e) =>
                      Expanded(
                        child: InkWell(
                          onTap:(){
                            Navigator.pushNamed(
                                context,AppRouter.serviceList);
                          },
                          child: Card(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(
                                  child: Column(
                                    children: [
                                      Image.asset(e.icon),
                                      Text(e.name),
                                    ],
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),
                )
                // Card(color: Colors.blue,  child: SizedBox(height:150,width:150,child:Center(child: Text("Plumbing")),),),
                // Card(color: Colors.green, child: SizedBox(height:150,width:150,child:Center(child: Text("Electricity")),),),
                // Card(color: Colors.red, child: SizedBox(height:150,width:150,child:Center(child: Text("Cleaning")),),),
              ],

            ),
            const Padding(padding: EdgeInsets.all(16)),
            const Text("Top Services", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return(state is ServiceListSuccessful)?  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [

                        ...state.serviceList.map((e)=>ServiceItemView(image:e.image, name: e.name, onPress: (){
                          Navigator.pushNamed(
                              context,AppRouter.serviceDetails,arguments: e.toJson());
                        } ,))


                      ] ): const SizedBox();



                }),

          ],
        ),
      ),
    );
  }
}

class Services {
  final String name;
  final String icon;
  final Color? color;

  Services({
    required this.name,
    required this.icon,
    this.color,
  });
}