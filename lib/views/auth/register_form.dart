import 'package:flutter/material.dart';
import 'package:flutter_task/generated/l10n.dart';
import 'package:flutter_task/theme/styles_text.dart';
import '../../../theme/custom_colors.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController userNameController;
  final TextEditingController passwordController;
  final TextEditingController emailNameController;
  final GlobalKey<FormState> formKey;
  final bool obscureText;
  final Function toggle;
  const RegisterForm({
    super.key,
    required this.userNameController,
    required this.passwordController,
    required this.emailNameController,
    required this.formKey,
    required this.obscureText,
    required this.toggle,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 22,
        children: <Widget>[
          TextFormField(
            textInputAction: TextInputAction.done,
            style: TextStyle(color: Colors.white),
            keyboardType: TextInputType.text,
            enableInteractiveSelection: false,
            controller: emailNameController,
            cursorColor: Colors.black,
            autofillHints: [AutofillHints.email],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "";
              } else if (!RegExp(
                r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
              ).hasMatch(value)) {
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              fillColor: CustomColors.blueDark.withOpacity(0.6),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0), // Rounded corners
                borderSide: BorderSide.none, // No visible border
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
                borderSide: BorderSide(color: Colors.red, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
                borderSide: BorderSide(
                  color: CustomColors.blueDark,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
                borderSide: BorderSide(
                  color: CustomColors.blueDark,
                  width: 1.0,
                ),
              ),
              hintText: S.current.email,
              contentPadding: const EdgeInsets.only(left: 20),
              hintStyle: ThemeText.b16,
            ),
          ),
          TextFormField(
            textInputAction: TextInputAction.done,
            style: TextStyle(color: Colors.white),
            keyboardType: TextInputType.text,
            enableInteractiveSelection: false,
            controller: userNameController,
            cursorColor: Colors.white,
            autofillHints: [AutofillHints.username],
            decoration: InputDecoration(
              fillColor: CustomColors.blueDark.withOpacity(0.6),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
                borderSide: BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
                borderSide: BorderSide(color: Colors.red, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
                borderSide: BorderSide(
                  color: CustomColors.blueDark,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
                borderSide: BorderSide(
                  color: CustomColors.blueDark,
                  width: 1.0,
                ),
              ),
              hintText: S.current.user_name,
              contentPadding: const EdgeInsets.only(left: 20),
              hintStyle: ThemeText.b16,
            ),
          ),
          TextFormField(
            textInputAction: TextInputAction.done,
            style: TextStyle(color: Colors.white),
            keyboardType: TextInputType.text,
            enableInteractiveSelection: false,
            controller: passwordController,
            cursorColor: Colors.white,
            obscureText: obscureText,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                color: Colors.grey,
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () => toggle(),
              ),
              fillColor: CustomColors.blueDark.withOpacity(0.6),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
                borderSide: BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
                borderSide: BorderSide(color: Colors.red, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
                borderSide: BorderSide(
                  color: CustomColors.blueDark,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
                borderSide: BorderSide(
                  color: CustomColors.blueDark,
                  width: 1.0,
                ),
              ),
              hintText: S.current.password,
              contentPadding: const EdgeInsets.only(left: 20),
              hintStyle: ThemeText.b16,
            ),
          ),
        ],
      ),
    );
  }
}
