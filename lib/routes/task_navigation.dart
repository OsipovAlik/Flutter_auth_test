import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/routes/model/nav_model.dart';
import 'package:flutter_task/store/task_navigation_store/task_navigaton_store.dart';
import 'package:flutter_task/theme/box_decoration.dart';
import 'package:flutter_task/theme/custom_colors.dart';
import 'package:flutter_task/views/home/home.dart';
import 'package:flutter_task/views/profile/profile.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  NavigationState createState() => NavigationState();
}

class NavigationState extends State<Navigation> {
  final PageController _pageController = PageController();
  final TaskNavigationStore taskNavigationStore = TaskNavigationStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          return PageView(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              taskNavigationStore.setSelectedIndex(index);
            },
            children: const [Home(), Profile()],
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 56,
          decoration: MyBoxDecoration.ListNavigation,
          child: Observer(
            builder: (_) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(bottomNavItems.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      taskNavigationStore.setSelectedIndex(index);
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    },
                    child: SizedBox(
                      width: 50,
                      child: Column(
                        children: [
                          const SizedBox(height: 14),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            child: SvgPicture.asset(
                              bottomNavItems[index].src,
                              width: 24,
                              colorFilter: ColorFilter.mode(
                                taskNavigationStore.selectedIndex == index
                                    ? CustomColors.blackLight
                                    : CustomColors.grey,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
