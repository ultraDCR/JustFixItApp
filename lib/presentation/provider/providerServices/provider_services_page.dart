import 'package:flutter/material.dart';
import 'package:just_fix_it/shared/constants/constants.dart';
import 'package:just_fix_it/shared/extensions/context_extensions.dart';

import '../../../core/theme/dimens.dart';
import '../../../shared/components/gap.dart';

class ProviderServicesPage extends StatelessWidget {
  const ProviderServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Services"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyServiceItemView(serviceName: "Ranjan's cleaning services", serviceType: 'Cleaning', createdOn: '20 May 2024', onEditPress: () {  },)
          ],
        ),
      ),

    );
  }
}

class MyServiceItemView extends StatelessWidget {
  const MyServiceItemView({
    super.key,
    required this.serviceName,
    required this.serviceType,
    required this.createdOn,
    required this.onEditPress,
  });

  final String serviceName;
  final String serviceType;
  final String createdOn;
  final VoidCallback onEditPress;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.colorScheme.onPrimary,
      margin: const EdgeInsets.all(Dimens.halfSpacing),
      child: InkWell(
        onTap: (){},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(serviceName, style: context.textTheme.titleMedium,),
                  Text("Service Type: $serviceType",style: context.textTheme.bodyMedium,),
                  Text("CreatedOn: $createdOn")
                ],
              ),
              const Gap.vertical(height: 10),
              IconButton(onPressed:onEditPress, color: context.colorScheme.primary, icon: Icon(Icons.edit))
            ],
          ),
        ),
      ),
    );
  }
}

