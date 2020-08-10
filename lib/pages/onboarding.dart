import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/colors/colors.dart';
import 'package:mobile/fonts/fontStyles.dart';
import 'package:mobile/pages/landing_page.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentStep = 0;
  List<String> texts = [
    "Encontre vários\nprofessores para\nensinar você",
    "Ou dê aulas\nsobre o que você\nmais conhece",
  ];
  List<String> images = ['assets/study-background.svg', 'assets/give-classes-background.svg'];
  Color themeColor = AppColors.purple;

  void next(BuildContext context) {
    if (currentStep == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage()));
    } else {
      setState(() {
        currentStep++;
        themeColor = AppColors.green;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Stack(
            children: <Widget>[
              Container(
                color: themeColor,
                width: double.infinity,
              ),
              Center(child: SvgPicture.asset(images[currentStep])),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            width: double.infinity,
            color: AppColors.background,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "0${currentStep + 1}.",
                    style: CustomFontStyles.stepText,
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    texts[currentStep],
                    style: CustomFontStyles.mainText,
                  ),
                  SizedBox(
                    height: 80.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                                width: 4.0,
                                height: 4.0,
                                color: currentStep == 0
                                    ? themeColor
                                    : Color(0xffC1BCCC)),
                            SizedBox(
                              width: 8.0,
                            ),
                            Container(
                                width: 4.0,
                                height: 4.0,
                                color: currentStep == 0
                                    ? Color(0xffC1BCCC)
                                    : themeColor),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.keyboard_arrow_right),
                        onPressed: () {
                          next(context);
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
