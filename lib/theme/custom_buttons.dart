import 'package:flutter/material.dart';

import 'custom_colors.dart';

abstract class CustomButtons {
  static ButtonStyle regBtn = ButtonStyle(splashFactory: NoSplash.splashFactory, padding: WidgetStateProperty.all(EdgeInsets.zero));
  static ButtonStyle greenBtn = ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    backgroundColor: CustomColors.global,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0), // Border radius here
    ),
  );
  static final counterOutStyledButton = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    backgroundColor: Colors.white,
  );
}
