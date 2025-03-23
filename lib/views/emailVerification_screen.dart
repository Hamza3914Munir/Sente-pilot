import 'package:flutter/material.dart';
import 'package:sente_pilot/utils/colors.dart';
import 'package:sente_pilot/views/signup_screen.dart';

class EmailVerificationScreen extends StatelessWidget {
  // final String email;

  const EmailVerificationScreen({super.key,
    // required this.email
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.lightPurple,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "lib/assets/images/app_logo.png",
                height: 200,
                width: 200,
              ),
              const Icon(
                Icons.mark_email_unread_outlined,
                size: 100,
                color: AppColors.primary,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Verify Your Email',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'A verification link has been sent to',
                style: TextStyle(
                  fontSize: 18,
                  color:AppColors.text,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "email@gmail.com",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Please check your inbox and just click on the link to verify your email address.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.text,
                ),
              ),
              const SizedBox(height: 30),
              Builder(builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    // EmailVerified()
                    //     .emailVerification(email: email, context: context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                  ),
                  child: const Text(
                    'Resend Email',
                    style: TextStyle(
                      color: AppColors.text,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                );
              }),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignupScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor:AppColors.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    side: const BorderSide(width: 3, color: AppColors.accent)),
                child: const Text(
                  'Change e-mail address',
                  style: TextStyle(
                    color:AppColors.text,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
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
