import 'package:flutter/material.dart';
import 'package:mobile/colors/colors.dart';
import 'package:mobile/fonts/fontStyles.dart';

class TeacherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColors.purple,
          ),
          Image.asset(
            'assets/splash-background.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Quer ser\num Proffy?", style: CustomFontStyles.teacherTitle,),
                    SizedBox(height: 8.0,),
                    Text(
                      '''Para começar, você precisa
se cadastrar como professor
na nossa plataforma web.''',
                      style: CustomFontStyles.teacherSubtitle,
                    ),
                  ],
                ),

                Container(
                  width: double.infinity,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding: EdgeInsets.symmetric(horizontal: 110.0, vertical: 15.0),
                    color: AppColors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text("Tudo Bem", style: CustomFontStyles.teacherButtonText,),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
