import 'package:ecommerce_app/features/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/responsive.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthStateNewUser) {
              context.goNamed('onBoardScreen');
            }
            if (state is AuthStateOnlySKipUser) {
              context.goNamed('homeScreen');
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: Responsive.width(context) * 0.1),
                child: Center(
                  child: Image.asset(
                    'assets/images/app_logo1.png',
                    height: 200,
                  ),
                ).animate()
                  ..fadeIn(duration: 500.ms).slideX(
                    begin: -1,
                    end: 0,
                    duration: 1300.ms,
                    curve: Curves.easeOut,
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
