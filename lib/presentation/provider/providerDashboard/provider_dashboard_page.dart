import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_fix_it/core/routing/app_router.dart';
import 'package:just_fix_it/data/repositories/auth_repository.dart';
import 'package:just_fix_it/domain/cubit/profile/profile_cubit.dart';
import 'package:just_fix_it/domain/preference/share_preference_util.dart';
import 'package:just_fix_it/presentation/home/dashboard_page.dart';
import 'package:just_fix_it/presentation/home/service_item_view.dart';
import 'package:just_fix_it/presentation/profile/profile_page.dart';
import 'package:just_fix_it/shared/extensions/context_extensions.dart';

import '../../../data/models/api_response/user.dart';
import '../../../shared/components/gap.dart';

class ProviderDashboardPage extends StatelessWidget {
  const ProviderDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileCubit(authRepository: context.read<AuthRepository>()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: context.colorScheme.onPrimary,
          title: Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, bottom: 10, top: 20),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: 40,
                  height: 40,
                ),
                const Gap.horizontal(width: 10),
                Expanded(
                    child: Text(
                  "JustFixIt",
                  style: context.textTheme.titleMedium,
                ))
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CommonButton(
                  title: "View My Services",
                  leadingIcon: Icons.view_agenda,
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.providerServices);
                  },
                ),
                const Gap.all(size: 10),
                CommonButton(
                      title: "Create services",
                      leadingIcon: Icons.create,
                      onTap: () {
                        Navigator.pushNamed(context, AppRouter.createService);
                      },
                    ),

                const Gap.all(size: 10),
                CommonButton(
                  title: "View services request",
                  leadingIcon: Icons.request_page,
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.providerRequests);
                  },
                ),
                const Gap.all(size: 10),
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    return state is ProfileSuccessful?
                     CommonButton(
                      title: "Edit your Profile",
                      leadingIcon: Icons.edit_note,
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRouter.editProfile,
                            arguments: state.profileData.toJson());
                      },
                    ) : const SizedBox();
                  },
                ),

                const Gap.all(size: 10),
                CommonButton(
                    title: "Logout",
                    color: Colors.redAccent,
                    leadingIcon: Icons.logout,
                    onTap: () async {
                      await SharePreferenceUtils().removeToken();
                      if (context.mounted) {
                        Navigator.of(context).popAndPushNamed(AppRouter.login);
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
