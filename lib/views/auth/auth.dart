import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/constants/constants.dart';
import 'package:flutter_task/generated/l10n.dart';
import 'package:flutter_task/store/auth_store/auth_store.dart';
import 'package:flutter_task/theme/box_decoration.dart';
import 'package:flutter_task/theme/custom_colors.dart';
import 'package:flutter_task/theme/styles_text.dart';
import 'package:flutter_task/views/auth/login_form.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final AuthStore _authStore = AuthStore();

  @override
  void dispose() {
    _authStore.disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(child: Image.asset('lib/assets/img/Subtract.png')),
                  Positioned(
                    top: 80,
                    left: 20,
                    child: SvgPicture.asset(logoSvg),
                  ),
                ],
              ),
              SizedBox(height: 80),
              SizedBox(
                height: 220,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Observer(
                    builder:
                        (_) => PageView(
                          clipBehavior: Clip.none,
                          physics: PageScrollPhysics(),
                          controller: _authStore.pageController,
                          onPageChanged:
                              (index) => _authStore.setCurrentPage(index),
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: LoginForm(
                                emailVisibly: false,
                                userNameController:
                                    _authStore.userNameController,
                                passwordController:
                                    _authStore.passwordController,
                                formKey: PageStorageKey('loginForm1'),
                                obscureText: _authStore.obscureText,
                                toggle: _authStore.toggleObscureText,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: LoginForm(
                                emailVisibly: true,
                                emailNameController: _authStore.emailController,
                                userNameController:
                                    _authStore.userNameController,
                                passwordController:
                                    _authStore.passwordController,
                                formKey: PageStorageKey('loginForm2'),
                                obscureText: _authStore.obscureText,
                                toggle: _authStore.toggleObscureText,
                              ),
                            ),
                          ],
                        ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  spacing: 62,
                  children: [
                    Observer(builder: (_) => _tabBar()),
                    Text(S.current.forgot_password, style: ThemeText.b16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabBar() {
    return Container(
      height: 45,
      width: MediaQuery.sizeOf(context).width,
      decoration: MyBoxDecoration.tabBar,
      child: Row(
        children: [
          _tabButton(S.current.login, 0),
          _tabButton(S.current.sign_up, 1),
        ],
      ),
    );
  }

  Widget _tabButton(String title, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _authStore.changePage(context, index),
        child: Observer(
          builder:
              (_) => AnimatedContainer(
                duration: Duration(milliseconds: 200),
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color:
                      _authStore.currentPage == index
                          ? CustomColors.blue
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: ThemeText.w14b,
                ),
              ),
        ),
      ),
    );
  }
}
