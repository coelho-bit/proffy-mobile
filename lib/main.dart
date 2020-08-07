import 'package:flutter/material.dart';
import 'package:mobile/pages/landing_page.dart';
import 'pages/onboarding.dart';
import 'pages/teacher_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Onboarding(),
      ),
    );
  }
}

