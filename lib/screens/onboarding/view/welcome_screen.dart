import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:masrofy/core/routes.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  bool _isLoading = false;

  Future<void> _simulateGoogleSignIn() async {
    setState(() => _isLoading = true);
    await Future.delayed(Duration.zero);
    if (!mounted) return;
    setState(() => _isLoading = false);
    GoRouter.of(context).pushReplacement(AppRoutes.kHomeView);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.15),

              Container(
                width: width * 0.6,
                height: width * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Image.asset('assets/images/logo.png')),
              ),

              SizedBox(height: height * 0.05),

              Text(
                'Welcome to',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: width * 0.09,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: height * 0.01),
              Text(
                'Masrofy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: width * 0.1,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: height * 0.07),

              Text(
                'Continue With ',
                style: TextStyle(
                  fontSize: width * 0.035,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: height * 0.04),

              // Social buttons
              Row(
                children: [
                  // ---------------- GOOGLE BUTTON ----------------
                  Expanded(
                    child: SizedBox(
                      height: height * 0.065,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _simulateGoogleSignIn,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            201,
                            198,
                            198,
                          ),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(
                              color: Colors.black,
                              width: 1.5,
                            ),
                          ),
                          elevation: 0,
                          shadowColor: Colors.transparent,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (_isLoading)
                              const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                  strokeWidth: 2,
                                ),
                              )
                            else ...[
                              Image.asset(
                                'assets/images/google.png',
                                width: 18,
                                height: 18,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'GOOGLE',
                                style: TextStyle(
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: width * 0.04),

                  // ---------------- PHONE BUTTON ----------------
                  Expanded(
                    child: SizedBox(
                      height: height * 0.065,
                      child: ElevatedButton(
                        onPressed: () {
                          GoRouter.of(context).push(AppRoutes.kPhoneView);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            201,
                            198,
                            198,
                          ),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(
                              color: Colors.black,
                              width: 1.5,
                            ),
                          ),
                          elevation: 0,
                          shadowColor: Colors.transparent,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.phone,
                              color: Colors.black,
                              size: 17,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'PHONE',
                              style: TextStyle(
                                fontSize: width * 0.035,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.06),
            ],
          ),
        ),
      ),
    );
  }
}
