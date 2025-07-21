import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart'; // Required for Ticker
import 'package:flutter/gestures.dart'; // Required for TapGestureRecognizer

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final List<TextEditingController> _otpControllers =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _otpFocusNodes =
      List.generate(4, (index) => FocusNode());
  int _resendTimer = 59;
  late Ticker _ticker;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  void _startResendTimer() {
    _ticker = Ticker((Duration elapsed) {
      setState(() {
        _resendTimer = 59 - (elapsed.inSeconds % 60);
        if (_resendTimer <= 0) {
          _ticker.stop();
        }
      });
    });
    _ticker.start();
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _otpFocusNodes) {
      focusNode.dispose();
    }
    _ticker.dispose();
    super.dispose();
  }

  void _onOtpChanged(String value, int index) {
    if (value.length == 1 && index < _otpControllers.length - 1) {
      _otpFocusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _otpFocusNodes[index - 1].requestFocus();
    }
    // You can also trigger verification when all fields are filled
    if (_otpControllers.every((controller) => controller.text.length == 1)) {
      // All OTP fields filled, trigger verification
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter verification code',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                text: 'A 4-digit SMS code was sent to your email\n',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
                children: [
                  TextSpan(
                    text: 'Wrong number? ',
                    style: const TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: 'Edit email address',
                        style: const TextStyle(color: Colors.orange, decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigate to edit email address
                          },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 60,
                  child: TextField(
                    controller: _otpControllers[index],
                    focusNode: _otpFocusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    onChanged: (value) => _onOtpChanged(value, index),
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                'Didn\'t get a code? Resend code in ${_resendTimer}s',
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home'); // Navigate to home after verification
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Verify'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
