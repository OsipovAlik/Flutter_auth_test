import 'package:flutter/material.dart';
import 'package:flutter_task/theme/custom_colors.dart';

class NavAnimatedBar extends StatelessWidget {
  final bool isActive;

  const NavAnimatedBar({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 700),
          height: isActive ? 3.0 : 0,
          width: 35,
          color: isActive ? CustomColors.blackLight : Colors.transparent,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 700),
          height: isActive ? 3.2 : 0,
          width: 22,
          color: isActive ? CustomColors.blackLight : Colors.transparent,
        ),
      ],
    );
  }
}
