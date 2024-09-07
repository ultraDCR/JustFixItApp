import 'package:flutter/material.dart';
import 'package:just_fix_it/core/theme/dimens.dart';
import 'package:just_fix_it/shared/components/gap.dart';
import 'package:just_fix_it/shared/constants/constants.dart';
import 'package:just_fix_it/shared/extensions/context_extensions.dart';

class ProviderRequestPage extends StatelessWidget {
  const ProviderRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Service Request")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ServiceRequestItemView( serviceName: 'Ranjans cleaning', serviceType: 'Cleaning', requestedBy: 'Ranjan', status: 'Pending', ),
              ServiceRequestItemView( serviceName: "Hir's Plumbing", serviceType: 'Plumbing', requestedBy: 'Sanyog regmi', status: 'Accepted', ),

            ],
          ),
        )
    );

  }
}

class ServiceRequestItemView extends StatelessWidget {
  const ServiceRequestItemView({
    super.key,
    required this.serviceName,
    required this.serviceType,
    required this.requestedBy,
    required this.status,
  });

  final String serviceName;
  final String serviceType;
  final String requestedBy;
  final String status;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(serviceName, style: context.textTheme.titleMedium,),
                  Text("Service Type: $serviceType",style: context.textTheme.bodyMedium,),
                  Text("Service Requested By: $requestedBy",style: context.textTheme.bodyMedium,),

                ],
              ),
              const Gap.vertical(height: 10),
              Row(
                children: [
                  Container(decoration: kDecorationCorner12.copyWith(color: Colors.lightBlueAccent,), padding:const EdgeInsets.only(left: 8,right: 8),child: Text("Status: $status" ,style: context.textTheme.bodyLarge, textAlign:TextAlign.center,)),
                  Spacer(),
                  IconButton(icon: const Icon(Icons.call),color: Colors.green,iconSize: 30, onPressed: () {  },),
                  Container(
                    width: 2,              // Width of the divider
                    height:25, // Takes up the full height
                    color: Colors.black,   // Color of the divider
                  ),
                  IconButton(icon:const Icon( Icons.message),color: Colors.blueAccent,iconSize: 30, onPressed: () {  },),
                ],
              ),
              const Gap.vertical(height: 10),

              const Divider(height: 2,),
              Row(
                children: [
                  Expanded(child: IconButton(icon: const Icon(Icons.check),color: Colors.green,iconSize: 30, onPressed: () {  },)),
                  Container(
                    width: 2,              // Width of the divider
                    height:40, // Takes up the full height
                    color: Colors.grey,   // Color of the divider
                  ),
                  Expanded(child: IconButton(icon:const Icon( Icons.cancel_rounded),color: Colors.redAccent,iconSize: 30, onPressed: () {  },)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
