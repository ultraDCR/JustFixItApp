
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:just_fix_it/core/theme/dimens.dart';
import 'package:just_fix_it/shared/components/forms/input.dart';
import 'package:just_fix_it/shared/components/gap.dart';
import 'package:just_fix_it/shared/constants/constants.dart';
import 'package:just_fix_it/shared/extensions/context_extensions.dart';

import '../../core/routing/app_router.dart';
import '../../domain/cubit/signup/signup_bloc.dart';
import '../../shared/components/buttons/button.dart';
import '../../shared/components/snack_bar/my_app_snackbar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<bool> isSelected = [true, false];

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  _onSignUpPressed() {
    if (_formKey.currentState?.validate() == true) {
      var name = _nameController.text;
      var address = _addressController.text;
      var email = _emailController.text;
      var password = _passwordController.text;
      var confirmPassword = _confirmPasswordController.text;
      context.read<SignupBloc>().add(SignUpButtonPressed(
          fullName: name,
          address: address,
          email: email,
          password: password,
          confirmPassword: confirmPassword,
        userType: isSelected[0] ? "customer" : "provider"
      ));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<SignupBloc, SignupState>(
        listener: (context, state) {
      if (state is SignupError) {
        ScaffoldMessenger.of(context).showSnackBar(myAppSnackBar(
            snackBarType: SnackBarType.error,
            message: state.message));
      } else if (state is SignupSuccessful) {
        int count = 0;
        Navigator.of(context).popUntil((_) => count++ >= 1);
        Navigator.of(context).popAndPushNamed( (state.authData["data"]["user"]["user_type"] == "provider") ? AppRouter.providerDashboard : AppRouter.home) ;

      }
    },
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo at the top
                Image.asset('assets/images/logo.png',width: 80,),
                const SizedBox(height: 20),

                // SignUp Text
                Text(
                  'Signup',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 30),
                ToggleButtons(
                  isSelected: isSelected,
                  borderRadius: BorderRadius.circular(10),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(Icons.person),
                        isSelected[0]? const Text("Customer") : const SizedBox(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(Icons.home_repair_service),
                        isSelected[1]? const Text("Provider") : const SizedBox(),
                        ],
                      ),
                    ),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < isSelected.length; i++) {
                        isSelected[i] = i == index;
                      }
                    });
                  },
                ),
                AutofillGroup(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Input(
                          autofillHints: const [AutofillHints.email],
                          controller: _nameController,
                          labelText: signup_fullnameLabel,
                          hintText: "eg: Jon Doe",
                          onChanged: (l) {},
                          textInputAction: TextInputAction.next,
                        ),
                        const Gap.vertical(height: Dimens.spacing),
                        Input(
                          autofillHints: const [AutofillHints.email],
                          controller: _emailController,
                          labelText: login_emailLabel,
                          hintText: login_emailHint,
                          onChanged: (l) {},
                          textInputAction: TextInputAction.next,
                        ),
                        const Gap.vertical(height: Dimens.spacing),
                        Input(
                          autofillHints: const [AutofillHints.email],
                          controller: _addressController,
                          labelText: signup_addressLabel,
                          hintText: "eg: 23/4 Blaxland Rd, Epping",
                          onChanged: (l) {},
                          textInputAction: TextInputAction.next,
                        ),
                        const Gap.vertical(height: Dimens.spacing),
                        Input(
                          autofillHints: const [AutofillHints.password],
                          controller: _passwordController,
                          isPassword: !_isPasswordVisible,
                          labelText: login_passwordLabel,
                          hintText: login_passwordHint,
                          onChanged: (l) {},
                          textInputAction: TextInputAction.done,
                          suffixIcon: IconButton(
                            onPressed: () =>
                                setState(() =>
                                _isPasswordVisible = !_isPasswordVisible),
                            icon: Icon(
                              _isPasswordVisible
                                  ? IconsaxPlusBroken.eye
                                  : IconsaxPlusBroken.eye_slash,
                              color: context.colorScheme.onSurface,
                            ),
                          ),
                        ),
                        const Gap.vertical(height: Dimens.spacing),
                        Input(
                          autofillHints: const [AutofillHints.password],
                          controller: _confirmPasswordController,
                          isPassword: !_isConfirmPasswordVisible,
                          labelText: signup_confirmPassLabel,
                          hintText: login_passwordHint,
                          onChanged: (l) {},
                          textInputAction: TextInputAction.done,
                          suffixIcon: IconButton(
                            onPressed: () =>
                                setState(() =>
                                _isConfirmPasswordVisible =
                                !_isConfirmPasswordVisible),
                            icon: Icon(
                              _isConfirmPasswordVisible
                                  ? IconsaxPlusBroken.eye
                                  : IconsaxPlusBroken.eye_slash,
                              color: context.colorScheme.onSurface,
                            ),
                          ),
                          onSubmitted: (_) => {},
                        ),
                      ],
                    ),
                  ),
                ),

                const Gap.vertical(height: Dimens.spacing),
                Button.primary(
                  title: signup_submitBtnLabel,
                  onPressed: _onSignUpPressed,
                ),

                // Already have an account? Login Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to login page
                        Navigator.maybePop(context);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.green.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    })
    );

  }
}