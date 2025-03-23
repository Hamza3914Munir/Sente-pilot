import 'package:flutter/material.dart';
import 'package:sente_pilot/utils/colors.dart';
import 'package:sente_pilot/views/resetpassword_screen.dart';
import 'package:sente_pilot/views/signup_screen.dart';
import '../viewmodels/cutom_textfield.dart';
import '../viewmodels/bottom_navigation_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.lightPurple,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey, // Assign the form key
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "lib/assets/images/app_logo.png",
                  height: 200,
                  width: 200,
                ),
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  labelText: 'Email',
                  prefixIcon: Icons.email,
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(
                      r'^[^@]+@[^@]+\.[^@]+',
                    ).hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null; // Valid input
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  labelText: 'Password',
                  visibility: visible == true ? true : false,
                  prefixIcon: Icons.lock,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        visible = !visible;
                      });
                    },
                    child:
                        visible == false
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                  ),
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null; // Valid input
                  },
                ),
                const SizedBox(height: 20),
                Builder(
                  builder: (context) {
                    return ElevatedButton(
                      onPressed: () async {
                        // if (_formKey.currentState!.validate()) {
                        //   await loginAuth(
                        //     context: context,
                        //     email: _emailController.text.trim(),
                        //     password: _passwordController.text.trim(),
                        //     security: _securityKeyController.text.trim(),
                        //   );
                        // }
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BottomNavBarScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary, // Background color
                        padding: const EdgeInsets.symmetric(
                          horizontal: 100,
                          vertical: 15,
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: AppColors.buttonText,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign-Up',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Forgot your password? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResetPasswordScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Reset Password',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
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
    );
  }
}
