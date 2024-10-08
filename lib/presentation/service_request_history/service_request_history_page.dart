import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_fix_it/core/theme/dimens.dart';
import 'package:just_fix_it/domain/cubit/requestHistory/request_history_cubit.dart';
import 'package:just_fix_it/presentation/home/dashboard_page.dart';
import 'package:just_fix_it/shared/components/gap.dart';
import 'package:just_fix_it/shared/extensions/context_extensions.dart';

class RequestHistoryPage extends StatelessWidget {
  const RequestHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: context.colorScheme.primary,
        title: const Text(
          'Request History',
        ),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<RequestHistoryCubit, RequestHistoryState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            return  state is RequestHistorySuccessful ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...state.requestHistory.map((history) =>
                      RequestItemView(
                        serviceName: history.servicename ??"",
                        serviceType: history.category ?? "",
                        serviceProvider: history.servicename ?? "Jim's cleaning",
                        status: history.status ?? "Pending"
                      ),
                )

              ],
            ) : SizedBox();
          },
        ),
      ),
    );
  }
}

class RequestItemView extends StatelessWidget {
  const RequestItemView({
    super.key,
    required this.serviceName,
    required this.serviceType,
    required this.serviceProvider,
    required this.status,
  });

  final String serviceName;
  final String serviceType;
  final String serviceProvider;
  final String status;

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                serviceName,
                style: context.textTheme.titleMedium,
              ),
              Text(
                "Service Type: $serviceType",
                style: context.textTheme.bodyMedium,
              ),
              Text(
                "Service Provided By: $serviceProvider",
                style: context.textTheme.bodyMedium,
              ),
              const Gap.vertical(height: 10),
              ColoredBox(
                  color: context.colorScheme.primary.withAlpha(80),
                  child: Text(
                    "Status: $status",
                    style: context.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
