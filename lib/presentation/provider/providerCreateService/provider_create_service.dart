import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_fix_it/core/routing/app_router.dart';
import 'package:just_fix_it/core/theme/dimens.dart';
import 'package:just_fix_it/domain/cubit/addService/add_service_cubit.dart';
import 'package:just_fix_it/presentation/home/dashboard_page.dart';
import 'package:just_fix_it/shared/components/buttons/button.dart';
import 'package:just_fix_it/shared/components/forms/input.dart';
import 'package:just_fix_it/shared/components/gap.dart';
import 'package:just_fix_it/shared/components/snack_bar/my_app_snackbar.dart';
import 'package:just_fix_it/shared/constants/constants.dart';
import 'package:just_fix_it/shared/extensions/context_extensions.dart';

import '../../../shared/constants/enums.dart';

class ProviderCreateServicePage extends StatefulWidget {
  const ProviderCreateServicePage({super.key});

  @override
  State<ProviderCreateServicePage> createState() =>
      _ProviderCreateServicePageState();
}

class _ProviderCreateServicePageState extends State<ProviderCreateServicePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _serviceNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _serviceTypeController = TextEditingController();
  final TextEditingController _priceRangeController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  dynamic _pickImageError;
  String? _filePath;
  ServiceCategory? _selectedService = ServiceCategory.Plumbing;


  void _onEditButtonPressed({BuildContext? context}) async {
    await _displayPickImageDialog(context!, (type) async {
      try {
        final XFile? pickedFile;
        switch (type) {
          case PickImageType.camera:
            pickedFile = await _picker.pickImage(
              source: ImageSource.camera,
            );
            break;
          case PickImageType.gallery:
            pickedFile = await _picker.pickImage(
              source: ImageSource.gallery,
            );
            break;
        }
        if (pickedFile?.path != null) {
          setState(() {
            _filePath = pickedFile?.path;
          });
        }
      } catch (e) {
        setState(() {
          _pickImageError = e;
        });
      }
    });
  }

  Future<void> _displayPickImageDialog(BuildContext context,
      OnPickImageCallback onPick) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Select One To Proceed"),
            actions: <Widget>[
              TextButton(
                child: const Text("Camara"),
                onPressed: () {
                  onPick(PickImageType.camera);
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                  child: const Text("Gallery"),
                  onPressed: () {
                    onPick(PickImageType.gallery);
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<AddServiceCubit, AddServiceState>(
      listener: (context, state) {
        if (state is AddServiceSuccessful) {
          ScaffoldMessenger.of(context).showSnackBar(
              myAppSnackBar(
                  message: "Service added successfully",
                  snackBarType: SnackBarType.success));
          Navigator.of(context).popAndPushNamed(AppRouter.providerDashboard);
        } else if (state is AddServiceError) {
          ScaffoldMessenger.of(context).showSnackBar(
              myAppSnackBar(
                  message: state.message,
                  snackBarType: SnackBarType.error));
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Create Servie"),),
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
                          labelText: "Service Name",
                          hintText: "eg: Ranjan's cleaning full service",
                          onChanged: (l) {},
                          textInputAction: TextInputAction.next,
                        ),
                        const Gap.vertical(height: Dimens.spacing),
                        Input(
                          controller: _descriptionController,
                          labelText: "Description",
                          hintText: ".......",
                          onChanged: (l) {},
                          maxLines: 10,
                          textInputAction: TextInputAction.next,
                        ),
                        const Gap.vertical(height: Dimens.spacing),
                        Input(
                          autofillHints: const [AutofillHints.email],
                          controller: _priceRangeController,
                          labelText: "Price Range",
                          hintText: "eg: \$200 - \$300",
                          onChanged: (l) {},
                          textInputAction: TextInputAction.next,
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap.vertical(height: Dimens.spacing),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Service type")),
                const Gap.vertical(height: Dimens.halfSpacing),
                DropdownButtonFormField<ServiceCategory>(
                  value: _selectedService,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.green),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  icon: const Icon(Icons.arrow_downward, color: Colors.green),
                  dropdownColor: Colors.white,
                  items: ServiceCategory.values.map((ServiceCategory service) {
                    return DropdownMenuItem<ServiceCategory>(
                      value: service,
                      child: Text(service.name,style: context.textTheme.bodyMedium,),
                    );
                  }).toList(),
                  onChanged: (ServiceCategory? newValue) {
                    setState(() {
                      _selectedService = newValue!;
                    });
                  },
                ),
                const Gap.vertical(height: Dimens.spacing),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Image")),
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      _onEditButtonPressed(
                        context: context,
                      );
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            child: SizedBox(
                                width: 100,
                                height: 100,
                                child:
                                // state.networkAvatar
                                //     ? Image.network(
                                //   state.avatar,
                                //   fit: BoxFit.cover,
                                // )
                                _filePath != null
                                    ? Image.file(
                                  File(_filePath!),
                                  fit: BoxFit.cover,
                                )
                                    : const Icon(Icons.add)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Gap.vertical(height: Dimens.spacing),
                Button.primary(
                  title: service_addBtnLabel,
                  onPressed: () {
                    context.read<AddServiceCubit>().onServiceAdded(
                        serviceName: _serviceNameController.text,
                        description: _descriptionController.text,
                        price: _priceRangeController.text,
                        imagePath: _filePath,
                      category: _selectedService
                    );
                  },
                ),

                // Already have an account? Login Text
              ],
            ),
          ),
        ),
      ),
    );
  }
}

typedef OnPickImageCallback = void Function(PickImageType type);
