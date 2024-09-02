import 'package:flutter/material.dart';
import 'package:just_fix_it/core/routing/app_router.dart';
import 'package:just_fix_it/presentation/home/service_item_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Service> services = [
    Service(name: "Plumbing", icon: 'assets/images/plumbing.png'),
    Service(name: "Electricity", icon: 'assets/images/electric.png'),
    Service(name: "Cleaning", icon: 'assets/images/cleaning.png'),
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: Center(
          child: Column(
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

              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const ServiceItemView(image: "assets/images/cleaning_banner.jpg"),
                  const ServiceItemView(image: "assets/images/plumbing_1.png"),
                  const ServiceItemView(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Service {
  final String name;
  final String icon;
  final Color? color;

  Service({
    required this.name,
    required this.icon,
    this.color,
  });
}