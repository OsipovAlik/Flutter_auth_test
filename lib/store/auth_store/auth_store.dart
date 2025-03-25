import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_task/generated/l10n.dart';
import 'package:flutter_task/routes/navigation.dart';
import 'package:flutter_task/services/model/user_model.dart';
import 'package:flutter_task/services/services.dart';
import 'package:flutter_task/widgets/snackbar_util/snackbar_util.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'auth_store.g.dart';

// ignore: library_private_types_in_public_api
class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final PageController pageController = PageController(initialPage: 0);

  @observable
  int currentPage = 0;

  @observable
  bool emailVisible = true;

  @observable
  bool obscureText = true;

  @observable
  bool currentLogin = false;

  @observable
  bool currentRegister = false;

  @observable
  List<UserModel> usersList = [];

  @action
  void toggleObscureText() {
    obscureText = !obscureText;
  }

  @action
  void setCurrentPage(int index) {
    currentPage = index;
    emailVisible = index != 0;
    clearvalues();
  }

  void loginUser(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString("users") ?? '[]';
    if (userNameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      if (data.isNotEmpty) {
        List<UserModel> usersList = (jsonDecode(data) as List).map((userJson) => UserModel.fromJson(userJson)).toList();
        for (var i = 0; i < usersList.length; i++) {
          if (userNameController.text == usersList[i].userName && passwordController.text == usersList[i].password) {
            Services.setUserLogin("token");
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const Navigation()), (Route<dynamic> route) => false);
          } else {
            SnackbarUtil.showSnackbar(context, S.current.no_user, duration: Duration(seconds: 1));
          }
        }
      } else {
        SnackbarUtil.showSnackbar(context, S.current.no_user, duration: Duration(seconds: 1));
      }
    } else {
      SnackbarUtil.showSnackbar(context, S.current.blank, duration: Duration(seconds: 1));
    }
  }

  void registerUser(BuildContext context, int idx) {
    if (emailController.text.isNotEmpty && userNameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      final user = UserModel(email: emailController.text, password: passwordController.text, userName: userNameController.text);
      usersList.add(user);
      Services.setUsers(usersList);
      currentPage = 0;
      pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.ease);
      clearvalues();
    } else {
      SnackbarUtil.showSnackbar(context, S.current.blank, duration: Duration(seconds: 1));
    }
  }

  void clearvalues() {
    emailController.clear();
    passwordController.clear();
    userNameController.clear();
  }

  @action
  void changePage(BuildContext context, int index) {
    if (currentPage == index) {
      if (index == 0) {
        loginUser(context);
      } else {
        registerUser(context, index);
      }
      return;
    }

    if (index == 0) {
      currentLogin = true;
      currentRegister = false;
    } else {
      currentRegister = true;
      currentLogin = false;
    }

    pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  void disposeControllers() {
    userNameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    pageController.dispose();
  }
}
