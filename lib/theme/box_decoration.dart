import 'package:flutter/material.dart';
import 'package:flutter_task/theme/custom_colors.dart';

abstract class MyBoxDecoration {
  // ignore: non_constant_identifier_names
  static BoxDecoration ListNavigation = BoxDecoration(border: Border(top: BorderSide(color: Colors.white, width: 0.1)));

  ///HS$$$//login tab decoretion
  static BoxDecoration tabBar = BoxDecoration(borderRadius: BorderRadius.circular(22.0), color: CustomColors.lightBlue);
  static BoxDecoration profile = BoxDecoration(
    borderRadius: BorderRadius.circular(100),
    color: Colors.white,
    boxShadow: [BoxShadow(color: const Color.fromARGB(255, 65, 64, 64).withOpacity(0.3), offset: Offset(0, 3), blurRadius: 13)],
  );
}
