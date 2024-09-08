import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_fix_it/core/routing/app_router.dart';
import 'package:just_fix_it/domain/cubit/profile/profile_cubit.dart';
import 'package:just_fix_it/domain/preference/share_preference_util.dart';
import 'package:just_fix_it/presentation/home/dashboard_page.dart';
import 'package:just_fix_it/shared/components/gap.dart';
import 'package:just_fix_it/shared/extensions/context_extensions.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Profile Information
                state is ProfileSuccessful ?
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          child: Image.asset(
                            "assets/images/profile2.png",
                            width: 40,
                            height: 40,
                          ),
                        ),
                        const Gap.horizontal(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${state.profileData.fullname}',
                                  style: context.textTheme.titleMedium),
                              Text('${state.profileData.email}',
                                  style: context.textTheme.bodyMedium),
                              // Text('Gender: Male',
                              //     style: TextStyle(fontSize: 14)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ) : const SizedBox(),
                const Gap.vertical(height: 20),
          
                Card(
                  child:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CommonButton(
                            leadingIcon: Icons.miscellaneous_services,
                            title: "My Request",
                            onTap: () {
                              Navigator.pushNamed(context, AppRouter.serviceHistory);
                            }),
                        CommonButton(
                            leadingIcon: Icons.password_outlined,
                            title: "Change Password", onTap: () {}
                        ),
                        CommonButton(
                            leadingIcon:  Icons.rate_review_outlined,
                            title: "Reviews", onTap: () {}
                        ),
                      ],
                    ),
                  ),
                ),
          
                Card(
                  child:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CommonButton(
                            leadingIcon: Icons.message_outlined,
                            title: "Faq",
                            onTap: () {
                              Navigator.pushNamed(context, AppRouter.faq);
                            }),
                        CommonButton(
                            leadingIcon: Icons.support_agent,
                            title: "Support", onTap: () {
                          Navigator.pushNamed(context, AppRouter.support);

                        }
                        ),
                        CommonButton(
                            leadingIcon:  Icons.policy,
                            title: "Terms And Conditions", onTap: () {
                          Navigator.pushNamed(context, AppRouter.termsAndConditions);

                        }
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap.vertical(height: 16),
                CommonButton(
                  leadingIcon: Icons.logout,
                    title: "Logout",
                    color: context.colorScheme.error,
                    onTap: () async {
                      await SharePreferenceUtils().removeToken();
                      if(context.mounted) {
                        Navigator.of(context).popAndPushNamed(AppRouter.login);
                      }
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CommonButton extends StatelessWidget {
  final String? title;
  final IconData? leadingIcon;
  final VoidCallback? onTap;
  final Color? color;

  const CommonButton(
      {super.key,
      required this.title,
      this.onTap,
      this.color,
      this.leadingIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: color ?? context.colorScheme.primary,   // Outline color
                width: 3.0,           // Outline thickness
              ),
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(leadingIcon,color: color ?? context.colorScheme.primary,),
                const Gap.horizontal(width: 10),
                Expanded(
                    child: Text(
                  title ?? "",
                  textAlign: TextAlign.start,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: color ?? context.colorScheme.primary,
                  ),
                )),
              ],
            )),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Center(
            child: Text(text,
                style: TextStyle(
                    fontSize: 18, color: context.colorScheme.onPrimary))),
      ),
    );
  }
}
