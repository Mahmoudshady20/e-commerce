import 'package:flutter/material.dart';

import '../../common/utils/validations_regex.dart';
import '../../common/widgets/custom_form_field.dart';
import '../login_screen/login_view.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'Register';
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController(text: 'Mohamed nabil');

  var emailController =
  TextEditingController(text: 'nabil_c8_online_1@route.com');

  var mobileController = TextEditingController(text: '01117576576');

  var passwordController = TextEditingController(text: '123456');

  var passwordConfirmationController = TextEditingController(text: '123456');

  RegisterScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 80,),
              Image.asset('assets/images/route_logo_big.png'),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomFormField(
                      controller: nameController,
                      label: 'Full Name',
                      hint: 'please enter Full Name',
                      validator: (text) {
                        if (text == null || text
                            .trim()
                            .isEmpty) {
                          return 'please enter full name';
                        }
                        return null;
                      },
                    ),
                    CustomFormField(
                      controller: emailController,
                      label: 'Email Address',
                      hint: 'please enter Email Address',
                      keyboardType: TextInputType.emailAddress,
                      validator: (text) {
                        if (text == null || text
                            .trim()
                            .isEmpty) {
                          return 'please enter email';
                        }
                        if (!ValidationRegex.emailRegex(text)) {
                          return 'please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    CustomFormField(
                      controller: mobileController,
                      label: 'Mobile No.',
                      hint: 'please enter your Mobile Number',
                      keyboardType: TextInputType.phone,
                      validator: (text) {
                        if (text == null || text
                            .trim()
                            .isEmpty) {
                          return 'please enter your Mobile Num';
                        }
                        return null;
                        // if (!ValidationUtils.isValidEmail(text)) {
                        //   return 'please enter a valid email';
                        // }
                      },
                    ),
                    CustomFormField(
                      controller: passwordController,
                      label: 'Password',
                      hint: 'please enter password',
                      keyboardType: TextInputType.text,
                      isPassword: true,
                      validator: (text) {
                        if (text == null || text
                            .trim()
                            .isEmpty) {
                          return 'please enter password';
                        }
                        if (text.length < 6) {
                          return 'password should at least 6 chars';
                        }
                        return null;
                      },
                    ),
                    CustomFormField(
                        controller: passwordConfirmationController,
                        label: 'Password Confirmation',
                        hint: 'Re-Type password',
                        keyboardType: TextInputType.text,
                        isPassword: true,
                        validator: (text) {
                          if (text == null || text
                              .trim()
                              .isEmpty) {
                            return 'please enter password-confirmation';
                          }
                          if (passwordController.text != text) {
                            return "password doesn't match";
                          }
                          return null;
                        }),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          backgroundColor: Theme
                              .of(context)
                              .primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 12)),
                      onPressed: () {
                        register();
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context,
                            LoginScreen.routeName);
                      }, child: Text('Already have account ? login',
                      style: Theme
                          .of(context)
                          .textTheme
                          .labelMedium,
                    ),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void register() async {
    // async - await
    if (formKey.currentState?.validate() == false) {
      return;
    }
  }
}