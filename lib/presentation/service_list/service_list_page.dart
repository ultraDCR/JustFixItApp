import 'package:flutter/material.dart';
import 'package:just_fix_it/presentation/home/service_item_view.dart';
import 'package:just_fix_it/shared/extensions/context_extensions.dart';

class ServiceListPage extends StatelessWidget {
  const ServiceListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
            backgroundColor: Colors.green.shade700,
            title: Text('Plumbing Services',style: context.textTheme.titleMedium,),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ServiceItemView(image: "assets/images/cleaning_banner.jpg"),
            ServiceItemView(image: "assets/images/plumbing_1.png"),
            ServiceItemView(),
          ],
        ),
      ),
    );
  }
}
