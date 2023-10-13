import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transisi_test_app/src/app/data/modules/dashboard_screen/views.dart';
import 'package:transisi_test_app/src/app/data/modules/logins_screen/controller.dart';
import 'package:transisi_test_app/src/app/util/constant/color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _loginController = LoginController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(borderSide: BorderSide()),
                          hintText: 'Username',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(borderSide: BorderSide()),
                          hintText: 'Password',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _loginController.login(_emailController.text,
                                _passwordController.text);
                            // Get.to(() => const DashboardScreen());
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
                              'Login Failed!',
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
