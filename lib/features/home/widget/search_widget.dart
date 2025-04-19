import 'package:ecommerce_app/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class HomeScreeSearchWidget extends StatelessWidget {
  const HomeScreeSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 240, 243, 233),
          filled: true,
          prefixIcon: Icon(Icons.search),
          prefixIconColor: AppColor.lemonGrassColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.transparent)),
        ),
      ),
    );
  }
}
