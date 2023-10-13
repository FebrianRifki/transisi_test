import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transisi_test_app/src/app/common_widget/custom_text_form_field.dart';
import 'package:transisi_test_app/src/app/data/modules/create_user_screen/controller.dart';
import 'package:transisi_test_app/src/app/util/constant/color.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final CreateUserController _controller = Get.put(CreateUserController());
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _siteController = TextEditingController();
  final GlobalKey<FormState> _firstNameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _lastNameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _jobFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    color: const Color.fromARGB(255, 3, 66, 117),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Row(children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 20,
                            )),
                        const Text(
                          'Create new employee',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: (() {
                            if (_firstNameFormKey.currentState!.validate() &&
                                _lastNameFormKey.currentState!.validate() &&
                                _jobFormKey.currentState!.validate()) {
                              _controller.createUser(
                                  _firstNameController.text,
                                  _lastNameController.text,
                                  _jobController.text);
                            }
                          }),
                          child: const Text(
                            'Save',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        )
                      ]),
                    )),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: (() async {
                      _controller.selectImage();
                    }),
                    child: Obx(
                      () => _controller.imageFile.value != null
                          ? CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  FileImage(_controller.imageFile.value!))
                          : Container(
                              height: 100,
                              width: 100,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 3, 66, 117),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              )),
                    )),
                CustomTextFormField(
                  icon: const Icon(Icons.person),
                  labelText: 'First Name *',
                  formKey: _firstNameFormKey,
                  controller: _firstNameController,
                  hasValidation: true,
                ),
                CustomTextFormField(
                  controller: _lastNameController,
                  formKey: _lastNameFormKey,
                  icon: const Icon(Icons.person),
                  labelText: 'Last Name *',
                  hasValidation: true,
                ),
                CustomTextFormField(
                  icon: const Icon(Icons.work),
                  labelText: 'Job *',
                  formKey: _jobFormKey,
                  controller: _jobController,
                  hasValidation: true,
                ),
                CustomTextFormField(
                  controller: _phoneNumberController,
                  icon: const Icon(Icons.phone),
                  labelText: 'Phone Number',
                  isPhoneNumber: true,
                ),
                CustomTextFormField(
                    controller: _emailController,
                    icon: const Icon(Icons.mail),
                    labelText: 'E-mail'),
                CustomTextFormField(
                    controller: _siteController,
                    icon: const Icon(Icons.web),
                    labelText: 'Site'),
                Obx(() {
                  if (_controller.isSuccess.isTrue) {
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      Get.snackbar(
                        'Success',
                        'User Created!',
                        colorText: Colors.white,
                        duration: const Duration(seconds: 2),
                        backgroundColor: primaryColor,
                      );
                    });
                  }
                  return const SizedBox.shrink();
                }),
                Obx(() {
                  if (_controller.isFailed.isTrue) {
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      Get.snackbar(
                        'Failed',
                        'User Created!',
                        colorText: Colors.white,
                        duration: const Duration(seconds: 2),
                        backgroundColor: Colors.red,
                      );
                    });
                  }
                  return const SizedBox.shrink();
                }),
              ],
            ),
          )),
    );
  }
}
