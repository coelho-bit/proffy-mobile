import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/class_model.dart';
import 'package:mobile/colors/colors.dart';
import 'package:mobile/fonts/fontStyles.dart';

class TeacherItem extends StatefulWidget {

  final TeacherClass teacherClass;
  final Function function;
  bool isFavorite;

  TeacherItem({ this.teacherClass, this.function, this.isFavorite });

  @override
  _TeacherItemState createState() => _TeacherItemState();
}

class _TeacherItemState extends State<TeacherItem> {
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
                    widget.teacherClass.avatar
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.teacherClass.name,
                    style: CustomFontStyles.teacherName,
                  ),
                  Text(
                    widget.teacherClass.subject,
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
              widget.teacherClass.bio,
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
            "Preço p/hora ${widget.teacherClass.cost}",
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
                    onPressed: () {
                      widget.function();
                      this.widget.isFavorite = !this.widget.isFavorite;
                      setState(() {
                      });
                    },
                    color: widget.isFavorite ? AppColors.red : AppColors.purple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: SvgPicture.asset(widget.isFavorite ? 'assets/unfavorite-teacher.svg' : 'assets/favorite-teacher.svg'),
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
                    onPressed: () {
                      print(widget.teacherClass.whatsapp);
                    },
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
