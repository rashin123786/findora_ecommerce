import 'package:action_slider/action_slider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constants/app_color.dart';
import 'package:ecommerce_app/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: Responsive.width(context) * 0.1),
              child: Center(
                child: Image.asset(
                  'assets/images/app_logo1.png',
                  //   width: Responsive.width(context) * 0.8,
                  height: 200,
                ),
              ).animate()
                ..fadeIn(duration: 500.ms) // Optional fade
                    .slideX(
                  begin: -1, // Start from left (outside screen)
                  end: 0, // End at normal position
                  duration: 1300.ms,
                  curve: Curves.easeOut,
                ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: ActionSlider.standard(
            backgroundColor: AppColor.mainColor,
            toggleColor: AppColor.secondaryColor,
            child: Text(
              'Slide to confirm',
              style: GoogleFonts.varelaRound(color: Colors.white),
            ),
            action: (controller) async {
              controller.loading();
              await Future.delayed(const Duration(seconds: 3));

              controller.success();

              if (context.mounted) {
                context.pushNamed('loginScreen');
                controller.reset();
              }
            },
          ).animate().slideY(
                begin: 0.4,
                end: -0.1,
                duration: 1400.ms,
                curve: Curves.easeOut,
              )),
    );
  }
}
