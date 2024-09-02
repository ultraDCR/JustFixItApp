import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ServiceDetailsScreen extends StatelessWidget implements AutoRouteWrapper{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: Text('Plumbing Services'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              Image.asset('assets/logo.png'), // Replace with your image path
              SizedBox(height: 20),

              // Title and Subtitle
              Text('Plumbing Services', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text('Jim\'s Plumbing', style: TextStyle(fontSize: 18, color: Colors.grey.shade700)),
              SizedBox(height: 20),

              // Description
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'No matter the type emergency or time of day or night, we can have a plumber at your home quickly to assist. Our 24/7 emergency plumbing service is available across Sydney, Melbourne, Brisbane and Adelaide.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),

              // Reviews
              Row(
                children: [
                  Icon(Icons.star, color: Colors.green.shade700, size: 30),
                  SizedBox(width: 10),
                  Text('4.5', style: TextStyle(fontSize: 24)),
                  SizedBox(width: 10),
                  Text('23 Reviews', style: TextStyle(fontSize: 18, color: Colors.grey.shade700)),
                ],
              ),
              SizedBox(height: 20),

              // Status and Request Button
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Status : Available',
                      style: TextStyle(fontSize: 18, color: Colors.green.shade700),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add request logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade700,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    child: Text('Request', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    // TODO: implement wrappedRoute
    throw UnimplementedError();
  }
}
