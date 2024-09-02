import 'package:flutter/material.dart';
import 'package:just_fix_it/presentation/home/dashboard_page.dart';
import 'package:just_fix_it/shared/components/gap.dart';
import 'package:just_fix_it/shared/extensions/context_extensions.dart';

class ServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Banner Image or Slider
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset('assets/images/plumbing_1.png'), // Replace with your banner image path
        ),

        SizedBox(height: 10),

        // Services List
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Services',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              ServiceTile(
                icon: "assets/images/plumbing.png",
                title: 'Plumbing',
                onTap: () {},
              ),
              ServiceTile(
                icon: "assets/images/electric.png",
                title: 'Electricity',
                onTap: () {},
              ),
              ServiceTile(
                icon: "assets/images/cleaning.png",
                title: 'Cleaning',
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ServiceTile extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;

  ServiceTile({required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 16, right: 16,bottom: 8),
          child: Row(
            children: [
              Image.asset(icon, color: context.colorScheme.primary, width: 40,height: 40,),
              const Gap.horizontal(width:10),
              Expanded(child: Center(child: Text(title,style: TextStyle(color: context.colorScheme.primary),))),
            ],
          ),
        ),
      ),
    );
  }
}