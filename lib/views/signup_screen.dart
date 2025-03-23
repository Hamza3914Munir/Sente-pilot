import 'package:flutter/material.dart';
import 'package:sente_pilot/utils/colors.dart';
import '../viewmodels/cutom_textfield.dart';
import 'emailVerification_screen.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _securityKeyController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  String? _gender;
  final _formKey = GlobalKey<FormState>();

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
                  height: 250,
                  width: 250,
                ),
                const Text(
                  'Sign-Up',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  labelText: 'First Name',
                  prefixIcon: Icons.person,
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  labelText: 'Last Name',
                  prefixIcon: Icons.person,
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
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
                    return null;
                  },
                ),
                 const SizedBox(height: 20),
                CustomTextFormField(
                  labelText: 'Phone Number (+256xxxxxxxxx)',
                  prefixIcon: Icons.phone,
                  controller: _phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    } else if (!RegExp(r'^\+256\d{9}$').hasMatch(value)) {
                      return 'Please enter a valid Ugandan phone number (+256xxxxxxxxx)';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  labelText: 'Date of Birth (DD/MM/YYYY)',
                  prefixIcon: Icons.calendar_today,
                  controller: _dobController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your date of birth';
                    } else if (!RegExp(r'^\d{2}/\d{2}/\d{4}$').hasMatch(value)) {
                      return 'Please enter a valid date in DD/MM/YYYY format';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    prefixIcon: Icon(Icons.person , color : AppColors.primary),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.primary, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.primary, width: 4),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.primary, width: 4),
                    ),
                  ),
                  value: _gender,
                  items: ['Male', 'Female', 'Transgender']
                      .map((gender) => DropdownMenuItem<String>(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your gender';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  labelText: 'Create Username',
                  prefixIcon: Icons.person,
                  controller: _securityKeyController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your security key';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  labelText: 'Password',
                  prefixIcon: Icons.lock,
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Builder(builder: (context) {
                  return ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmailVerificationScreen(
                                // email: _emailController.text.trim()
                              )));
                      // if (_formKey.currentState!.validate()) {
                      //   // final QuerySnapshot result = await FirebaseFirestore
                      //   //     .instance
                      //   //     .collection('users')
                      //   //     .where('email',
                      //   //         isEqualTo: _emailController.text.trim())
                      //   //     .limit(1)
                      //   //     .get();
                      //   // if (result.docs.isNotEmpty) {
                      //   //   ScaffoldMessenger.of(context)
                      //   //       .showSnackBar(const SnackBar(
                      //   //     content: Text(
                      //   //         "The account already exists for that email."),
                      //   //     backgroundColor: Colors.red,
                      //   //   ));
                      //   //   return;
                      //   // }
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => EmailVerificationScreen(
                      //               // email: _emailController.text.trim()
                      //           )));
                      //   // SignIn().signUP(
                      //   //     name: _nameController.text.trim(),
                      //   //     email: _emailController.text.trim(),
                      //   //     password: _passwordController.text.trim(),
                      //   //     security: _securityKeyController.text.trim(),
                      //   //     context: context);
                      // }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 15),
                    ),
                    child: const Text(
                      'Verify Email',
                      style: TextStyle(
                        color: AppColors.buttonText,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: const Text(
                        'Login',
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
