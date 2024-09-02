import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Banner Image or Slider
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset('assets/images/logo.png'), // Replace with your banner image path
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
                icon: Icons.plumbing,
                title: 'Plumbing',
                onTap: () {},
              ),
              ServiceTile(
                icon: Icons.electric_bolt,
                title: 'Electricity',
                onTap: () {},
              ),
              ServiceTile(
                icon: Icons.cleaning_services,
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
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  ServiceTile({required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.green.shade700),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}