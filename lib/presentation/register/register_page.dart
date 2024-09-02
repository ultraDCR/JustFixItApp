
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:just_fix_it/core/theme/dimens.dart';
import 'package:just_fix_it/shared/components/forms/input.dart';
import 'package:just_fix_it/shared/components/gap.dart';
import 'package:just_fix_it/shared/constants/constants.dart';
import 'package:just_fix_it/shared/extensions/context_extensions.dart';

import '../../shared/components/buttons/button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo at the top
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.green.shade100,
                  child: Image.asset('assets/logo.png'), // replace with your logo image
                ),
                SizedBox(height: 20),

                // SignUp Text
                Text(
                  'Signup',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700,
                  ),
                ),
                SizedBox(height: 30),

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
                          hintText:  "eg: Jon Doe",
                          onChanged: (l){},
                          textInputAction: TextInputAction.next,
                        ),
                        const Gap.vertical(height: Dimens.spacing),
                        Input(
                          autofillHints: const [AutofillHints.email],
                          controller: _emailController,
                          labelText: login_emailLabel,
                          hintText:  login_emailHint,
                          onChanged: (l){},
                          textInputAction: TextInputAction.next,
                        ),
                        const Gap.vertical(height: Dimens.spacing),

                        Input(
                          autofillHints: const [AutofillHints.password],
                          controller: _passwordController,
                          isPassword: !_isPasswordVisible,
                          labelText:  login_passwordLabel,
                          hintText:  login_passwordHint,
                          onChanged: (l){},
                          textInputAction: TextInputAction.done,
                          suffixIcon: IconButton(
                            onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                            icon: Icon(
                              _isPasswordVisible ? IconsaxPlusBroken.eye : IconsaxPlusBroken.eye_slash,
                              color: context.colorScheme.onSurface,
                            ),
                          ),
                        ),
                        const Gap.vertical(height: Dimens.spacing),
                        Input(
                          autofillHints: const [AutofillHints.password],
                          controller: _confirmPasswordController,
                          isPassword: !_isConfirmPasswordVisible,
                          labelText:  signup_confirmPassLabel,
                          hintText:  login_passwordHint,
                          onChanged: (l){},
                          textInputAction: TextInputAction.done,
                          suffixIcon: IconButton(
                            onPressed: () => setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible),
                            icon: Icon(
                              _isConfirmPasswordVisible ? IconsaxPlusBroken.eye : IconsaxPlusBroken.eye_slash,
                              color: context.colorScheme.onSurface,
                            ),
                          ),
                          onSubmitted: (_) =>{},
                        ),
                      ],
                    ),
                  ),
                ),

                const Gap.vertical(height: Dimens.spacing),
                Button.primary(
                  title:  signup_submitBtnLabel,
                  onPressed: (){},
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
      ),
    );
  }
}