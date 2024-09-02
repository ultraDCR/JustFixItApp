import 'package:flutter/material.dart';
import 'package:just_fix_it/core/routing/app_router.dart';
import 'package:just_fix_it/presentation/home/dashboard_page.dart';
import 'package:just_fix_it/shared/components/gap.dart';
import 'package:just_fix_it/shared/extensions/context_extensions.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Profile Information
           Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Image.asset("assets/images/profile2.png", width: 40,height: 40,),
                  ),
                  const Gap.horizontal(width: 20),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: Hira Bdr. Rana Kaucha',
                            style: TextStyle(fontSize:18,fontWeight: FontWeight.bold)),
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
          CommonButton(title:"My Request", onTap: (){
            Navigator.pushNamed(context, AppRouter.serviceHistory);
          }),
          CommonButton(title:"Change Password", onTap: (){}),
          CommonButton(title:"Reviews", onTap: (){}),
          CommonButton(title:"Logout", color: context.colorScheme.error, onTap: (){}),

        ],
      ),
    );
  }
}

class CommonButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  final Color? color;
  const CommonButton({
    super.key, required this.title, this.onTap, this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
            color: color ?? context.colorScheme.primary,
            padding: const EdgeInsets.all(16),
            child: Expanded(child: Text(title ?? "",textAlign: TextAlign.center,style: context.textTheme.bodyLarge?.copyWith(color: context.colorScheme.onPrimary,),))),
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
