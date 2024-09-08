import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_fix_it/core/theme/dimens.dart';
import 'package:just_fix_it/domain/cubit/providerServiceRequest/provider_service_request_cubit.dart';
import 'package:just_fix_it/shared/components/gap.dart';
import 'package:just_fix_it/shared/constants/constants.dart';
import 'package:just_fix_it/shared/extensions/context_extensions.dart';

class ProviderRequestPage extends StatelessWidget {
  const ProviderRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Service Request")),
        body: BlocConsumer<ProviderServiceRequestCubit,
            ProviderServiceRequestState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return state is ProviderServiceRequestSuccessful
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        ...state.providerServiceRequest.map(
                          (request) => ServiceRequestItemView(
                            serviceName: request.serviceDetails?.name ?? "",
                            requestedBy: request.customerDetails?.fullname ??"",
                            requesterEmail: request.customerDetails?.email ??"",
                            status: request.status  ?? "",
                            approvedPressed: () {
                              context.read<ProviderServiceRequestCubit>().approveRequest(requestId: request.id ??"");
                            },
                            cancelPressed: () {
                              context.read<ProviderServiceRequestCubit>().cancelRequest(requestId: request.id ??"");

                            },
                          ),
                        )
                      ],
                    ),
                  )
                : SizedBox();
          },
        ));
  }
}

class ServiceRequestItemView extends StatelessWidget {
  const ServiceRequestItemView({
    super.key,
    required this.serviceName,
    required this.requestedBy,
    required this.requesterEmail,
    required this.status,
    required this.approvedPressed,
    required this.cancelPressed,
  });

  final String serviceName;
  final String requestedBy;
  final String requesterEmail;
  final String status;
  final VoidCallback approvedPressed;
  final VoidCallback cancelPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.colorScheme.onPrimary,
      margin: const EdgeInsets.all(Dimens.halfSpacing),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    serviceName,
                    style: context.textTheme.titleMedium,
                  ),
                  Text(
                    "Requested By: $requestedBy",
                    style: context.textTheme.bodyMedium,
                  ),
                  Text(
                    "Email: $requesterEmail",
                    style: context.textTheme.bodyMedium,
                  ),
                ],
              ),
              const Gap.vertical(height: 10),
              Row(
                children: [
                  Container(
                      decoration: kDecorationCorner12.copyWith(
                        color: Colors.lightBlueAccent,
                      ),
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        "Status: $status",
                        style: context.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      )),
                  Spacer(),
                  IconButton(
                    icon: const Icon(Icons.call),
                    color: Colors.green,
                    iconSize: 30,
                    onPressed: () {},
                  ),
                  Container(
                    width: 2, // Width of the divider
                    height: 25, // Takes up the full height
                    color: Colors.black, // Color of the divider
                  ),
                  IconButton(
                    icon: const Icon(Icons.message),
                    color: Colors.blueAccent,
                    iconSize: 30,
                    onPressed: () {},
                  ),
                ],
              ),
              const Gap.vertical(height: 10),
              const Divider(
                height: 2,
              ),
              if(status == "pending")
              Row(
                children: [
                  Expanded(
                      child: IconButton(
                    icon: const Icon(Icons.check),
                    color: Colors.green,
                    iconSize: 30,
                    onPressed: approvedPressed,
                  )),
                  Container(
                    width: 2, // Width of the divider
                    height: 40, // Takes up the full height
                    color: Colors.grey, // Color of the divider
                  ),
                  Expanded(
                      child: IconButton(
                    icon: const Icon(Icons.cancel_rounded),
                    color: Colors.redAccent,
                    iconSize: 30,
                    onPressed: cancelPressed,
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
