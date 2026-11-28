import 'package:go_router/go_router.dart';
import 'package:masrofy/core/constants.dart';
import 'package:masrofy/core/routes.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_pinput/flutter_pinput.dart';

class VerifyPhoneView extends StatefulWidget {
  const VerifyPhoneView({super.key});

  @override
  State<VerifyPhoneView> createState() => _VerifyPhoneViewState();
}

class _VerifyPhoneViewState extends State<VerifyPhoneView> {
  final TextEditingController pinController = TextEditingController();
  final FocusNode pinFocusNode = FocusNode();

  @override
  void dispose() {
    pinController.dispose();
    pinFocusNode.dispose();
    super.dispose();
  }

  void _verifyCode() {
    if (pinController.text.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter the complete code')),
      );
      return;
    }

    context.go(AppRoutes.kRootView);
  }

  void _sendAgain() {
    pinController.clear();

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('A new code has been sent')));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    final defaultPinTheme = PinTheme(
      width: screenWidth * 0.12,
      height: screenHeight * 0.07,
      textStyle: TextStyle(
        fontSize: screenWidth * 0.055,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenWidth * 0.03),
        border: Border.all(color: Colors.grey.shade300),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: kPrimaryColor, width: 2),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.white,
        border: Border.all(color: kPrimaryColor),
      ),
    );

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.06,
              vertical: screenHeight * 0.035,
            ),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.06),

                Icon(
                  Icons.lock_outline_rounded,
                  size: screenWidth * 0.2,
                  color: Colors.white,
                ),

                SizedBox(height: screenHeight * 0.035),

                Text(
                  'Verification Code',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: screenHeight * 0.015),

                Text(
                  'Enter the 6-digit code sent to your phone',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: screenHeight * 0.05),

                Pinput(
                  length: 6,
                  controller: pinController,
                  focusNode: pinFocusNode,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  keyboardType: TextInputType.number,
                  showCursor: true,
                  cursor: Container(
                    width: 2,
                    height: screenHeight * 0.03,
                    color: kPrimaryColor,
                  ),
                ),

                SizedBox(height: screenHeight * 0.04),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _verifyCode,
                    child: const Text('Verify'),
                  ),
                ),

                SizedBox(height: screenHeight * 0.025),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Didn't receive the code?"),
                    TextButton(
                      onPressed: _sendAgain,
                      child: const Text('Send Again'),
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
