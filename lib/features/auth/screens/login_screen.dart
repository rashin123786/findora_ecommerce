import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ecommerce_app/core/constants/app_color.dart';
import 'package:ecommerce_app/core/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Skip",
                  style: GoogleFonts.varelaRound(
                    color: Colors.white,
                  ),
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
            const SizedBox(height: 60),
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
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
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
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
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
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.secondaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Login",
                          style: GoogleFonts.varelaRound(color: Colors.white),
                        ),
                      ).animate().fadeIn(
                            duration: 1000.ms,
                            curve: Curves.easeOut,
                          ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          indent: 10,
                          endIndent: 10,
                        )),
                        Text("Or Sign with"),
                        Expanded(
                            child: Divider(
                          indent: 10,
                          endIndent: 10,
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
