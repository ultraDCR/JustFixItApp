import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_fix_it/core/routing/app_router.dart';
import 'package:just_fix_it/core/theme/dimens.dart';
import 'package:just_fix_it/data/models/api_response/user.dart';
import 'package:just_fix_it/domain/cubit/editProfile/edit_profile_cubit.dart';
import 'package:just_fix_it/shared/components/buttons/button.dart';
import 'package:just_fix_it/shared/components/forms/input.dart';
import 'package:just_fix_it/shared/components/gap.dart';
import 'package:just_fix_it/shared/components/snack_bar/my_app_snackbar.dart';
import 'package:just_fix_it/shared/constants/constants.dart';

class EditProfilePage extends StatefulWidget {
  final User user;

  const EditProfilePage({super.key, required this.user});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController _fullnameController;
  late final TextEditingController _addressController;

  @override
  void initState() {
    _fullnameController = TextEditingController(text: widget.user.fullname);
    _addressController = TextEditingController(text: widget.user.address);
    super.initState();
  }

  @override
  void dispose() {
    _fullnameController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile"),),
      body: BlocListener<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state is EditProfileSuccessful) {
            ScaffoldMessenger.of(context).showSnackBar(
                myAppSnackBar(
                    message: "Profile updated successfully",
                    snackBarType: SnackBarType.success));
            Navigator.of(context).popAndPushNamed(AppRouter.providerDashboard);
          } else if (state is EditProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(
                myAppSnackBar(
                    message: state.message,
                    snackBarType: SnackBarType.error));
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gap.vertical(height: Dimens.tripleSpacing),
                  Image.asset('assets/images/logo.png', width: 80,),
                  const SizedBox(height: 20),

                  // SignUp Text
                  const SizedBox(height: 30),
                  AutofillGroup(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Input(
                            autofillHints: const [AutofillHints.name],
                            controller: _fullnameController,
                            labelText: signup_fullnameLabel,
                            hintText: "",
                            onChanged: (l) {},
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                          ),
                          const Gap.vertical(height: Dimens.spacing),
                          Input(
                            autofillHints: const [AutofillHints.name],
                            controller: _addressController,
                            labelText: signup_addressLabel,
                            hintText: "",
                            onChanged: (l) {},
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap.vertical(height: Dimens.spacing),
                  Button.primary(
                    title: edit_updateBtnLabel,
                    onPressed: () {
                      context.read<EditProfileCubit>().editProfile(
                          newName: _fullnameController.text,
                          newAddress: _addressController.text);
                    },
                  ),
                  const Gap.vertical(height: Dimens.doubleSpacing),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
