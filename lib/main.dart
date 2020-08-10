import 'package:flutter/material.dart';
import 'colors/colors.dart';
import 'pages/onboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: AppColors.purple,
        accentColorBrightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Onboarding()
      ),
    );
  }
}

