import 'package:flutter/material.dart';
import 'package:just_fix_it/presentation/home/dashboard_page.dart';
import 'package:just_fix_it/shared/extensions/context_extensions.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Information
          const Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person, size: 30),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: Hira Bdr. Rana Kaucha',
                            style: TextStyle(fontSize:16,fontWeight: FontWeight.bold)),
                        Text('Email: hirakaucha1234@gmail.com',
                            style: TextStyle(fontSize: 14)),
                        Text('Gender: Male', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),

          // Profile Actions
          ActionButton(text: 'My Request', onPressed: () {}),
          ActionButton(text: 'Change Password', onPressed: () {}),
          ActionButton(text: 'Reviews', onPressed: () {}),
          ActionButton(text: 'Logout', onPressed: () {}),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  ActionButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green.shade700,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Center(child: Text(text, style: TextStyle(fontSize: 18, color: context.colorScheme.onPrimary))),
      ),
    );
  }
}
