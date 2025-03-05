import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:home_services_provider/app_constants/app_colors.dart';
import 'package:home_services_provider/app_modules/home_module/view/home_page.dart';
import 'package:home_services_provider/app_modules/register_module/view/register_page.dart';
import 'package:home_services_provider/app_widgets/custom_button.dart';
import 'package:home_services_provider/app_widgets/normal_text_field.dart';
import 'package:home_services_provider/app_widgets/password_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Perform login logic here
      if (kDebugMode) {
        print('Email: ${_emailController.text}');
        print('Password: ${_passwordController.text}');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Service provider logged in successfully!')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80),
                // App Logo or Title
                Center(
                  child: Text(
                    'Home Service Pro',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.firstColor,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Login to manage your business',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                // Email Field
                Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                NormalTextField(
                  textEditingController: _emailController,
                  validatorFunction: (value) {
                    // if (value == null || value.isEmpty) {
                    //   return 'Please enter your email';
                    // }
                    // if (!value.contains('@')) {
                    //   return 'Please enter a valid email';
                    // }
                    return null;
                  },
                  hintText: "Enter your email",
                  textFieldIcon: Icon(Icons.email),
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                // Password Field
                Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                PasswordTextField(
                  passwordController: _passwordController,
                ),
                SizedBox(height: 10),
                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Navigate to forgot password screen
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: AppColors.secondColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                // Login Button
                CustomButton(
                  buttonWidth: double.infinity,
                  backgroundColor: AppColors.firstColor,
                  textColor: AppColors.fifthColor,
                  labelText: "Login",
                  onClick: _login,
                ),
                SizedBox(height: 20),
                // Sign Up Option
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: AppColors.secondColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
