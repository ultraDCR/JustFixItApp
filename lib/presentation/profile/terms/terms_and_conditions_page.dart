import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
        backgroundColor: Colors.green,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms and Conditions',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                '1. Acceptance of Terms',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'By accessing and using this app, you agree to be bound by these terms and conditions. If you do not agree, please do not use the app.',
              ),
              SizedBox(height: 16),
              Text(
                '2. Use of Service',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'You agree to use the services provided by this app in a lawful manner. You must not misuse our services or interfere with our app in any unlawful way.',
              ),
              SizedBox(height: 16),
              Text(
                '3. Changes to Terms',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'We reserve the right to modify these terms at any time. Changes will be effective immediately upon posting. It is your responsibility to review these terms periodically.',
              ),
              // Add more terms and conditions as needed
              SizedBox(height: 32),
              Text(
                'If you have any questions about these Terms and Conditions, please contact support.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
