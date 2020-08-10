import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/colors/colors.dart';
import 'package:mobile/fonts/fontStyles.dart';

class TeacherItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String subject;
  final String bio;
  final String cost;
  final String whatsapp;

  TeacherItem(
      {this.name,
      this.bio,
      this.cost,
      this.imageUrl,
      this.subject,
      this.whatsapp});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Color(0xffE6E6F0),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 64.0,
                height: 64.0,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://avatars0.githubusercontent.com/u/14273790?s=460&u=25773aaf7628a02d02e9b8fdbc9e0e58e4d2ebcf&v=4"),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: CustomFontStyles.teacherName,
                  ),
                  Text(
                    subject,
                    style: CustomFontStyles.teacherSubject,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 24.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              bio,
              style: CustomFontStyles.teacherBio,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Divider(),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Preço p/hora $cost",
            style: CustomFontStyles.teacherCostValue,
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 56.0,
                  child: FlatButton(
                    onPressed: () {},
                    color: AppColors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: SvgPicture.asset('assets/favorite-teacher.svg'),
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                flex: 4,
                child: Container(
                  height: 56.0,
                  child: FlatButton.icon(
                    label: Text(
                      "Entrar em Contato",
                      style: CustomFontStyles.teacherContactButton,
                    ),
                    onPressed: () {},
                    color: AppColors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    icon: SvgPicture.asset('assets/whatsapp.svg'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
