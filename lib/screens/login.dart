import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Icon(
            Icons.arrow_back_ios,
          ),
          const SizedBox(height: 20),
          Text('Login'),
        ],
      ),
    );
  }
}
