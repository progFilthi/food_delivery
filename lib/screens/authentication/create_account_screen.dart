import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; // Required for TapGestureRecognizer
import 'package:food_delivery_app/widgets/custom_text_field.dart';
import 'package:food_delivery_app/widgets/custom_phone_field.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Handle back button
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create your account',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'You\'re 5 minutes away from ordering your first meal!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Sign up with Google
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.g_mobiledata), // Placeholder for Google icon
                    label: const Text('Sign up with google'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Sign up with Apple
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.apple), // Placeholder for Apple icon
                    label: const Text('Sign up with apple'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Center(
              child: Text(
                'Or continue as guest',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 24),
            CustomTextField(label: 'Full name *', hintText: 'e.g. John Doe'),
            const SizedBox(height: 16),
            CustomPhoneField(label: 'Phone number *', prefixText: '+44'),
            const SizedBox(height: 16),
            CustomTextField(label: 'Email address', hintText: 'e.g. johndoe@gmail.com'),
            const SizedBox(height: 16),
            CustomTextField(label: 'Date of birth', hintText: 'DD/MM/YYYY', suffixIcon: Icons.calendar_today),
            const SizedBox(height: 24),
            Row(
              children: [
                Checkbox(
                  value: _agreedToTerms,
                  onChanged: (bool? value) {
                    setState(() {
                      _agreedToTerms = value ?? false;
                    });
                  },
                  activeColor: Colors.orange,
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'I agree to Afrifisha ',
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Terms of use',
                          style: const TextStyle(color: Colors.orange, decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigate to terms of use
                            },
                        ),
                        const TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy policy',
                          style: const TextStyle(color: Colors.orange, decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigate to privacy policy
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _agreedToTerms ? () {
                  Navigator.pushNamed(context, '/verification');
                } : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Sign me up!'),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text(
                  'Already have an account? Log in',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
