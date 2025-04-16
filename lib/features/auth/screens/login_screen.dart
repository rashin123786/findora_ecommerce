import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ecommerce_app/core/constants/app_color.dart';
import 'package:ecommerce_app/core/constants/constant.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppConstants.sizedBoxH10,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthStateOnlySKipUser) {
                      context.goNamed('homeScreen');
                    }
                  },
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: state is AuthStateSkipSavingLoading
                          ? () {
                              debugPrint("Loading......");
                            }
                          : () {
                              context
                                  .read<AuthBloc>()
                                  .add(AuthEventOnSkipButtonClick());
                            },
                      child: Text(
                        "Skip",
                        style: GoogleFonts.varelaRound(
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            AppConstants.sizedBoxH10,
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  "Welcome to Findora\nDiscover Your Next Find",
                  textAlign: TextAlign.center,
                  textStyle: GoogleFonts.varelaRound(fontSize: 18),
                  colors: [Colors.white, Colors.white],
                ),
              ],
            ),
            AppConstants.sizedBoxH10,
            AppConstants.sizedBoxH10,
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: GoogleFonts.varelaRound(
                            fontSize: 13,
                          ),
                          focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          border: OutlineInputBorder(),
                        ),
                      ).animate()
                        ..fadeIn(duration: Duration(milliseconds: 1000)).slideX(
                            begin: 1,
                            end: 0,
                            duration: 1000.ms,
                            curve: Curves.easeOutQuart),
                      const SizedBox(height: 16),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: GoogleFonts.varelaRound(
                            fontSize: 13,
                          ),
                          focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          border: OutlineInputBorder(),
                        ),
                      ).animate()
                        ..fadeIn(duration: Duration(milliseconds: 1000)).slideX(
                          begin: -1,
                          end: 0,
                          duration: 1000.ms,
                          curve: Curves.easeOutQuart,
                        ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: loginScreenButtonStyle,
                          child: Text(
                            "Login",
                            style: GoogleFonts.varelaRound(color: Colors.white),
                          ),
                        ).animate().fadeIn(
                              duration: 1000.ms,
                              curve: Curves.easeOut,
                            ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Divider(
                            indent: 10,
                            color: Colors.black,
                            endIndent: 10,
                          )),
                          Text("Or Sign with"),
                          Expanded(
                              child: Divider(
                            color: Colors.black,
                            indent: 10,
                            endIndent: 10,
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: loginScreenButtonStyle.copyWith(
                              side: WidgetStatePropertyAll(BorderSide(
                                  color: AppColor.secondaryColor, width: 0.3)),
                              backgroundColor: WidgetStatePropertyAll(
                                  const Color.fromARGB(255, 255, 255, 255))),
                          icon: Image.asset(
                            'assets/images/google.png',
                            width: 20,
                          ),
                          label: Text(
                            "Google",
                            style: GoogleFonts.varelaRound(
                                color: AppColor.mainColor),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
