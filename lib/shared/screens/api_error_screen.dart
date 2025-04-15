import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ApiErrorScreen extends StatelessWidget {
  const ApiErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl:
                  'https://img.freepik.com/premium-vector/internet-connection-problem-concept-illustration-404-found-error-page-cat-sits-laptop_450656-182.jpg',
              errorWidget: (context, url, error) => Icon(
                Icons.error,
                color: Colors.red,
              ),
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  context.go('/splashScreen');
                },
                child: Text(
                  "Retry",
                  style: GoogleFonts.varelaRound(
                    decoration: TextDecoration.underline,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
