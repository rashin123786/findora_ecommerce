import 'package:ecommerce_app/core/constants/app_color.dart';
import 'package:flutter/material.dart';

ButtonStyle loginScreenButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: AppColor.secondaryColor,
  padding: const EdgeInsets.symmetric(vertical: 16),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
);
