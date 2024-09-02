import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:just_fix_it/core/routing/app_router.dart';
import 'package:just_fix_it/core/theme/dimens.dart';
import 'package:just_fix_it/data/network_service.dart';
import 'package:just_fix_it/data/repositories/auth_repository.dart';
import 'package:just_fix_it/domain/cubit/auth/login/login_cubit.dart';
import 'package:just_fix_it/shared/components/buttons/button.dart';
import 'package:just_fix_it/shared/components/forms/input.dart';
import 'package:just_fix_it/shared/components/gap.dart';
import 'package:just_fix_it/shared/constants/constants.dart';
import 'package:just_fix_it/shared/extensions/context_extensions.dart';

@RoutePage()
class LoginScreen extends StatefulWidget implements AutoRouteWrapper {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(authRepository: AuthRepository(networkService: NetworkService.instance)),
      child: this,
    );
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        // state.whenOrNull(
        //     loading: (email, password) => LoadingDialog.show(context: context),
        //     success: (email, password, response) => LoadingDialog.hide(context: context),
        //     error: (email, password, error) => LoadingDialog.hide(context: context));
      },
      child: Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gap.vertical(height: Dimens.tripleSpacing),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.green.shade100,
                    child: Image.asset('assets/logo.png'), // replace with your logo image
                  ),
                  SizedBox(height: 20),
            
                  // SignUp Text
                  Text(
                    'Login',
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
                            onSubmitted: (_) => _onLogin(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap.vertical(height: Dimens.spacing),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text( login_forgotPasswordLabel),
                    ),
                  ),
                  const Gap.vertical(height: Dimens.spacing),
                  Button.primary(
                    title:  login_submitBtnLabel,
                    onPressed: _onLogin,
                  ),
                  const Gap.vertical(height: Dimens.doubleSpacing),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account?",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRouter.signup);
                        },
                        child: Text(
                          'SignUp',
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
      ),
    );
  }

  void _onLogin() => context.read<LoginCubit>().loginUser(email: "email", password: "password");
}
