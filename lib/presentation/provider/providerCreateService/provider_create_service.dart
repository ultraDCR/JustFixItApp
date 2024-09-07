import 'package:flutter/material.dart';
import 'package:just_fix_it/core/theme/dimens.dart';
import 'package:just_fix_it/shared/components/buttons/button.dart';
import 'package:just_fix_it/shared/components/forms/input.dart';
import 'package:just_fix_it/shared/components/gap.dart';
import 'package:just_fix_it/shared/constants/constants.dart';

class ProviderCreateServicePage extends StatefulWidget {
  const ProviderCreateServicePage({super.key});

  @override
  State<ProviderCreateServicePage> createState() => _ProviderCreateServicePageState();
}

class _ProviderCreateServicePageState extends State<ProviderCreateServicePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _serviceNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _serviceTypeController = TextEditingController();
  final TextEditingController _priceRangeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("Create Servie"),) ,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo at the top

              const SizedBox(height: 30),
              AutofillGroup(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Input(
                        autofillHints: const [AutofillHints.email],
                        controller: _serviceNameController,
                        labelText: signup_fullnameLabel,
                        hintText: "eg: Jon Doe",
                        onChanged: (l) {},
                        textInputAction: TextInputAction.next,
                      ),
                      const Gap.vertical(height: Dimens.spacing),
                      Input(
                        autofillHints: const [AutofillHints.email],
                        controller: _descriptionController,
                        labelText: login_emailLabel,
                        hintText: login_emailHint,
                        onChanged: (l) {},
                        maxLines: 10,
                        textInputAction: TextInputAction.next,
                      ),
                      const Gap.vertical(height: Dimens.spacing),
                      Input(
                        autofillHints: const [AutofillHints.email],
                        controller: _priceRangeController,
                        labelText: signup_addressLabel,
                        hintText: "eg: 23/4 Blaxland Rd, Epping",
                        onChanged: (l) {},
                        textInputAction: TextInputAction.next,
                      ),
                    ],
                  ),
                ),
              ),

              const Gap.vertical(height: Dimens.spacing),
              Button.primary(
                title: service_addBtnLabel,
                onPressed: (){},
              ),

              // Already have an account? Login Text
            ],
          ),
        ),
      ),
    );
  }
}
