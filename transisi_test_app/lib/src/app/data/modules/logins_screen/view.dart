import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transisi_test_app/src/app/data/modules/logins_screen/controller.dart';
import 'package:transisi_test_app/src/app/util/constant/color.dart';
import 'package:transisi_test_app/src/app/util/string/string.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _loginController = LoginController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _userNameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: const AssetImage('assets/images/3293465.jpg'),
                height: height * 0.5,
              ),
              Card(
                color: primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Form(
                        key: _userNameFormKey,
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: const OutlineInputBorder(
                                borderSide: BorderSide()),
                            hintText: 'Username',
                            errorText: _loginController.isErrorUsername.isTrue
                                ? userNameErrorText
                                : '',
                          ),
                          validator: (value) {
                            return _loginController.validateUserName(value);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Form(
                        key: _passwordFormKey,
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: const OutlineInputBorder(
                                borderSide: BorderSide()),
                            hintText: 'Password',
                            errorText: _loginController.isErrorPassword.isTrue
                                ? passowrdErrorText
                                : '',
                          ),
                          validator: (value) {
                            return _loginController.validatePassword(value);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (_userNameFormKey.currentState!.validate() &&
                                _passwordFormKey.currentState!.validate()) {
                              _loginController.login(_emailController.text,
                                  _passwordController.text);
                            }
                          },
                          child: const Text('Login')),
                      Obx(() {
                        if (_loginController.isSuccessLogin.isTrue) {
                          WidgetsBinding.instance
                              .addPostFrameCallback((timeStamp) {
                            Get.snackbar(
                              'Success',
                              'Login Successfully!',
                              colorText: Colors.white,
                              duration: const Duration(seconds: 2),
                              backgroundColor: primaryColor,
                            );
                          });
                        }
                        return const SizedBox.shrink();
                      }),
                      Obx(() {
                        if (_loginController.isFailedLogin.isTrue) {
                          WidgetsBinding.instance
                              .addPostFrameCallback((timeStamp) {
                            Get.snackbar(
                              'Failed',
                              'Wrong username or password',
                              duration: const Duration(seconds: 2),
                              backgroundColor: Colors.redAccent,
                            );
                          });
                        }
                        return const SizedBox.shrink();
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
