import 'package:flutter/material.dart';
import 'package:just_fix_it/presentation/home/service_item_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> services = ["Plumbing", "Electricity", "Cleaning"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: Center(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16/9,
                child:  Container(
                  color: Colors.blueGrey,
                  margin: const EdgeInsets.all(10),
                ),
              ),
              const Text("Services", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...services.map(
                            (e) => 
                                Card(
                                  color: Colors.white,
                                  child: SizedBox(
                                    height:150,
                                    width:150,
                                    child:Center(
                                        child: Column(
                                          children: [
                                            Image.asset("assets/images/logo.png"),
                                            Text(e),
                                          ],
                                        )
                                    ),
                                  ),
                                ),
                    )
                    // Card(color: Colors.blue,  child: SizedBox(height:150,width:150,child:Center(child: Text("Plumbing")),),),
                    // Card(color: Colors.green, child: SizedBox(height:150,width:150,child:Center(child: Text("Electricity")),),),
                    // Card(color: Colors.red, child: SizedBox(height:150,width:150,child:Center(child: Text("Cleaning")),),),
                  ],
        
                ),
              ),
              const Padding(padding: EdgeInsets.all(16)),
              const Text("Top Services", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),

              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const ServiceItemView(),
                  const ServiceItemView(),
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
