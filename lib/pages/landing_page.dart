import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile/colors/colors.dart';
import 'package:mobile/components/landing_button.dart';
import 'package:mobile/fonts/fontStyles.dart';
import 'package:mobile/pages/teacher_list.dart';
import 'package:mobile/pages/teacher_page.dart';

class LandingPage extends StatelessWidget {

  void buttonFunction(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.purple,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 36.0),
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Image.asset(
                    'assets/landing@2x.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 56.0,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Seja bem-vindo.\nO que deseja fazer?",
                        style: CustomFontStyles.landingMainText,
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LandingButton(
                            icon: 'assets/study-icon.png',
                            color: AppColors.lighterPurple,
                            title: "Estudar",
                              buttonFunction: () {
                                buttonFunction(context, TeacherList());
                              }
                          ),
                          LandingButton(
                            icon: 'assets/give-classes-icon.png',
                            color: AppColors.green,
                            title: "Dar Aulas",
                            buttonFunction: () {
                              buttonFunction(context, TeacherScreen());
                            }
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        "Total de 285 conexões\njá realizadas s2",
                        style: CustomFontStyles.connections,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
