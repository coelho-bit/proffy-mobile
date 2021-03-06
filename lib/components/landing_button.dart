import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/fonts/fontStyles.dart';

class LandingButton extends StatelessWidget {

  final String icon;
  final String title;
  final Color color;
  final Function buttonFunction;

  LandingButton({ this.icon, this.title, this.color, this.buttonFunction });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: buttonFunction,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0)
        ),
        padding: EdgeInsets.symmetric(vertical: 24.0),
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(icon),
            SizedBox(height: 50.0,),
            Text(title, style: CustomFontStyles.landingButtonText,)
          ],
        ),
      ),
    );
  }
}
