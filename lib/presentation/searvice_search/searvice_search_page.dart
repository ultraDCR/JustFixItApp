import 'package:flutter/material.dart';
import 'package:just_fix_it/presentation/home/service_item_view.dart';
import 'package:just_fix_it/shared/components/gap.dart';

class ServiceSearchPage extends StatelessWidget {
  const ServiceSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Padding(
          padding: const EdgeInsets.only( left: 8.0,right: 8.0,bottom: 10,top: 20),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 45,
                  child: TextField(
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
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ServiceItemView(image: "assets/images/cleaning_banner.jpg", onPress: () {  },),
            ServiceItemView(image: "assets/images/plumbing_1.png", onPress: () {  },),
            ServiceItemView(onPress: () {  },),
          ],
        ),
      ),
    );
  }
}
