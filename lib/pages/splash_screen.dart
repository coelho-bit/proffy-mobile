import 'package:flutter/material.dart';
import 'package:mobile/colors/colors.dart';
import 'package:mobile/fonts/fontStyles.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(color: AppColors.purple,),
        Image.asset('assets/splash-background.png', fit: BoxFit.cover,),
        Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset('assets/logo@3x.png'),
            SizedBox(height: 6.0,),
            Text("Sua plaforma de\nestudos online.", style: CustomFontStyles.landingSubtitle),
          ],
        ),),
      ],
    );
  }
}
