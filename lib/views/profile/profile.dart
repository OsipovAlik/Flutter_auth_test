import 'package:flutter/material.dart';
import 'package:flutter_task/theme/styles_text.dart';
import 'package:flutter_task/views/auth/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
  }

  void _logOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    Navigator.of(context, rootNavigator: true).pushReplacement(MaterialPageRoute(builder: (context) => const Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      _logOut();
                    },
                    child: const Icon(Icons.logout_outlined, size: 35),
                  ),
                ],
              ),
              const Text('Profile', style: ThemeText.b16b),
              const SizedBox(height: 10),
              SizedBox(width: 150, height: 150, child: const Image(image: AssetImage('lib/assets/img/profile.jpeg'))),
              const SizedBox(height: 5),
              const Text("Name Surname", style: ThemeText.b16b),
              const Text("example@gmail.com", style: ThemeText.b16),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
