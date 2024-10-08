import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_fix_it/data/models/api_response/service.dart';
import 'package:just_fix_it/domain/cubit/serviceDetails/service_details_cubit.dart';
import 'package:just_fix_it/presentation/home/service_item_view.dart';
import 'package:just_fix_it/shared/components/gap.dart';
import 'package:just_fix_it/shared/components/snack_bar/my_app_snackbar.dart';
import 'package:just_fix_it/shared/extensions/context_extensions.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final Service service;
  const ServiceDetailsScreen(this.service, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ServiceDetailsCubit, ServiceDetailsState>(
      listener: (context, state) {
        if (state is ServiceRequestSuccessful) {
          ScaffoldMessenger.of(context).showSnackBar(
              myAppSnackBar(
                  message: "Your Request was successfully sent",
                  snackBarType: SnackBarType.success));
        } else if (state is ServiceDetailsError) {
          ScaffoldMessenger.of(context).showSnackBar(
              myAppSnackBar(
                  message: state.message,
                  snackBarType: SnackBarType.error));
        }
      },
  child: Scaffold(
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image
                    ImageItem(image: service.image ?? ""),
                    const SizedBox(height: 20),

                    // Title and Subtitle
                    Text(service.name ??"", style: context.textTheme.titleMedium),
                    // Text(service.id, style: context.textTheme.bodyMedium),
                    const SizedBox(height: 20),

                    // Description
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        service.description ??'No matter the type emergency or time of day or night, we can have a plumber at your home quickly to assist. Our 24/7 emergency plumbing service is available across Sydney, Melbourne, Brisbane and Adelaide.',
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                    const Gap.vertical(height: 20),
                    Divider(color: Colors.green.shade700,height: 2,),
                    // Reviews
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.green.shade700, size: 40),
                        const Gap.horizontal(width: 10),
                        Text('4.5', style: context.textTheme.headlineLarge),
                        const Gap.horizontal(width: 10),
                        Text('23 Reviews', style: context.textTheme.bodySmall?.copyWith(color: Colors.grey.shade700)),
                      ],
                    ),
                    Divider(color: Colors.green.shade700,height: 2,),

                    const Gap.vertical(height: 20),

                    // Status and Request Button
                  ],
                ),
              ),
            ),
          ),
          ColoredBox(
            color: context.colorScheme.onPrimary,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text("Status :  ", style: context.textTheme.titleMedium),
                        Text(
                          'Available',
                          style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.primary),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add request logic here
                      context.read<ServiceDetailsCubit>().requestForService(serviceId: service.id ??"");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade700,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    ),
                    child: Text('Request', style: TextStyle(fontSize: 18,color: context.colorScheme.onPrimary)),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    ),
);
  }

}
