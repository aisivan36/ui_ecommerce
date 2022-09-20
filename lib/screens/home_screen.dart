import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            // alignment: Alignment.topCenter,
            children: [
              DecoratedBox(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(150, 0, 0, 0),
                      blurRadius: 90,
                      spreadRadius: 32,
                      blurStyle: BlurStyle.normal,
                      offset: Offset(0.0, 110.0),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/images/home.jpg',
                  height: 560,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text('Vertical Widget'),
        ],
      ),
    );
  }
}
