import 'package:e_commerce_route/common/utils/validations_regex.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/custom_form_field.dart';
import '../register_screen/register_view.dart';


class LoginScreen extends StatelessWidget {
  static const String routeName = 'login';

  LoginScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController(text: 'nabil@route.com');

  final TextEditingController passwordController = TextEditingController(text: '123456');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/route_logo_big.png'),
              Text('Welcome Back To Route',style: Theme.of(context).textTheme.labelLarge,),
              Text('Please sign in with your mail',style: Theme.of(context).textTheme.labelSmall,),
              const SizedBox(height: 20,),
              Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomFormField(
                        controller: emailController,
                        label: 'Email Address',
                        hint: 'please enter Email Address',
                        keyboardType: TextInputType.emailAddress,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'please enter email';
                          }
                          if (!ValidationRegex.emailRegex(text)) {
                            return 'please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      CustomFormField(
                        controller: passwordController,
                        label: 'Password',
                        hint: 'please enter password',
                        keyboardType: TextInputType.text,
                        isPassword: true,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'please enter password';
                          }
                          if (text.length < 6) {
                            return 'password should at least 6 chars';
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            backgroundColor: Theme.of(context).primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 12)),
                        onPressed: () {
                          login();
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 24,color: Colors.white),
                        ),
                      ),
                      TextButton(onPressed: (){
                        Navigator.pushReplacementNamed(context,
                            RegisterScreen.routeName);
                      },child: Text('Don’t have an account? Create Account',
                        style: Theme.of(context).textTheme.labelMedium,),),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void login() async {
    // async - await
    if (formKey.currentState?.validate() == false) {
      return;
    }
  }
}

/**
 * Padding(
    padding: const EdgeInsets.all(8.0),
    child: SingleChildScrollView(
    child: Form(
    key: formKey,
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    SizedBox(
    height: 80,
    ),
    Image.asset('assets/images/route_logo_big.png'),
    Text(
    'Welcome Back To Route',
    style: Theme.of(context).textTheme.labelLarge,
    ),
    Text(
    'Please sign in with your mail',
    style: Theme.of(context).textTheme.labelSmall,
    ),
    CustomFormField(
    controller: emailController,
    label: 'Email Address',
    hint: 'please enter Email Address',
    keyboardType: TextInputType.emailAddress,
    validator: (text) {
    if (text == null || text.trim().isEmpty) {
    return 'please enter email';
    }
    if (!ValidationRegex.emailRegex(text)) {
    return 'please enter a valid email';
    }
    },
    ),
    CustomFormField(
    controller: passwordController,
    label: 'Password',
    hint: 'please enter password',
    keyboardType: TextInputType.text,
    isPassword: true,
    validator: (text) {
    if (text == null || text.trim().isEmpty) {
    return 'please enter password';
    }
    if (text.length < 6) {
    return 'password should at least 6 chars';
    }
    },
    ),
    ElevatedButton(
    style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12)),
    backgroundColor: Theme.of(context).primaryColor,
    padding: EdgeInsets.symmetric(vertical: 12)),
    onPressed: () {
    login();
    },
    child: const Text(
    'Login',
    style: TextStyle(fontSize: 24),
    ),
    ),
    TextButton(onPressed: (){
    Navigator.pushReplacementNamed(context,
    RegisterScreen.routeName);
    },child: Text('Don’t have an account? Create Account',
    style: Theme.of(context).textTheme.labelMedium,),),

    ],
    ),
    ),
    ),
    )
 */