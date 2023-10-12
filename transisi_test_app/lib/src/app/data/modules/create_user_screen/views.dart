import 'package:flutter/material.dart';
import 'package:transisi_test_app/src/app/common_widget/custom_text_form_field.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
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
                          'Create new contact',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                        const Spacer(),
                        const Text(
                          'Save',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        )
                      ]),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
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
                const CustomTextFormField(
                    icon: Icon(Icons.person), labelText: 'First Name'),
                const CustomTextFormField(
                    icon: Icon(Icons.person), labelText: 'Last Name'),
                const CustomTextFormField(
                    icon: Icon(Icons.work), labelText: 'Company'),
                const CustomTextFormField(
                  icon: Icon(Icons.phone),
                  labelText: 'Phone Number',
                  isPhoneNumber: true,
                ),
                const CustomTextFormField(
                    icon: Icon(Icons.mail), labelText: 'E-mail'),
                const CustomTextFormField(
                    icon: Icon(Icons.web), labelText: 'Site')
              ],
            ),
          )),
    );
  }
}
