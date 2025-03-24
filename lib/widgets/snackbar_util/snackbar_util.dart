import 'package:flutter/material.dart';
import '../../theme/custom_colors.dart';
import '../../theme/styles_text.dart';


class SnackbarUtil {
  static void showSnackbar(BuildContext context, String message,  {Duration duration = const Duration(seconds: 3)}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: CustomColors.blueGrey,
        content: Text(
          message,
          style: ThemeText.r16b,
        ),
        duration: duration,
      ),
      
    );
    
  }
  
}
