import 'package:flutter/material.dart';
import 'package:sente_pilot/utils/colors.dart';
import '../viewmodels/cutom_textfield.dart';
import 'login_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _securityKeyController = TextEditingController();
  final Widget email = const Icon(Icons.email_outlined);
  final _formKey = GlobalKey<FormState>();

  ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.lightPurple,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "lib/assets/images/app_logo.png",
                  height: 200,
                  width: 200,
                ),
                const Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  labelText: 'Email',
                  prefixIcon: Icons.email,
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null; // Valid input
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  labelText: 'Security Key',
                  prefixIcon: Icons.security,
                  controller: _securityKeyController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your security key';
                    }
                    return null; // Valid input
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Please check your inbox ',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.text,
                              ),
                            ),
                            WidgetSpan(
                              child: Icon(
                                Icons.email_outlined,
                                color:AppColors.primary,
                                size: 20,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' and just click on the link to reset your password.',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.text,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Builder(builder: (context) {
                  return ElevatedButton(
                    onPressed: () async {
                      // if (_formKey.currentState!.validate()) {
                      //   await resetPassword(
                      //       email: _emailController.text.trim(),
                      //       security: _securityKeyController.text.trim(),
                      //       context: context);
                      // }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary, // Background color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 15),
                    ),
                    child: const Text(
                      'Reset Password',
                      style: TextStyle(
                          color: AppColors.buttonText,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  );
                }),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Remembered your password? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color:AppColors.primary, fontWeight: FontWeight.bold),
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
