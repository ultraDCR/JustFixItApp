import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support'),
        backgroundColor: Colors.green,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Need Help?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'We are here to help you! Please reach out to us for any support or questions you have regarding the app or services.',
            ),
            SizedBox(height: 24),
            Text(
              'Contact Us',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.email, color: Colors.green),
              title: Text('support@justfixit.com'),
              subtitle: Text('Email us with any inquiries.'),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.green),
              title: Text('+677 - 480598906'),
              subtitle: Text('Call us for immediate support.'),
            ),
          ],
        ),
      ),
    );
  }
}
