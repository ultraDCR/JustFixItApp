import 'package:flutter/material.dart';
import 'package:just_fix_it/core/routing/app_router.dart';
import 'package:just_fix_it/core/theme/dimens.dart';
import 'package:just_fix_it/presentation/home/dashboard_page.dart';
import 'package:just_fix_it/shared/extensions/context_extensions.dart';

class ServiceItemView extends StatefulWidget {
  const ServiceItemView({super.key});

  @override
  State<ServiceItemView> createState() => _ServiceItemViewState();
}

class _ServiceItemViewState extends State<ServiceItemView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.colorScheme.onPrimary,
      margin: const EdgeInsets.all(Dimens.minSpacing),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(
              context,AppRouter.serviceDetails);
        },
        child: Padding(
          padding: const EdgeInsets.all(Dimens.halfSpacing),
          child: Column(
            children: [
                  Image.asset("assets/images/logo.png",width: 80, height: 80,),
                  Column(
                    children: [
                      Text(style: context.textTheme.titleMedium,"Ranjans plumbing services"),
                      Text(style: context.textTheme.bodySmall, "Ranjans plumbing services"),
                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
