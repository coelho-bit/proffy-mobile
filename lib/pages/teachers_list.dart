import 'package:flutter/material.dart';
import 'package:mobile/class_model.dart';
import 'package:mobile/colors/colors.dart';
import 'package:mobile/components/filter_container.dart';
import 'package:mobile/components/teacher_item.dart';
import 'package:mobile/database/database_services.dart';
import 'package:mobile/fonts/fontStyles.dart';

class TeachersList extends StatefulWidget {
  @override
  _TeachersListState createState() => _TeachersListState();
}

class _TeachersListState extends State<TeachersList> {
  bool isFilterVisible = false;
  List<TeacherClass> teacherList = [];
  List<int> idsList = <int>[];

  void getIdsList() async {
    idsList = await DatabaseService.db.getIdsList();
  }

  @override
  void initState() {
    super.initState();
    getIdsList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: isFilterVisible ? 350.0 : 200.0,
          width: double.infinity,
          color: AppColors.purple,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Proffys\ndisponíveis",
                  style: CustomFontStyles.teacherListTitle,
                ),
                SizedBox(
                  height: 24.0,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFilterVisible = !isFilterVisible;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.filter_list,
                        color: AppColors.green,
                      ),
                      Text(
                        "Filtrar por dia, hora e matéria",
                        style: CustomFontStyles.filterLabel,
                      ),
                      Icon(
                        !isFilterVisible
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        color: Color(0xffD4C2FF),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Color(0xff9871F5),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Visibility(
                  visible: isFilterVisible,
                  child: FilterContainer(
                    onFilterResult: (List<TeacherClass> list) {
                      teacherList = list;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: isFilterVisible ? 300.0 : 150.0),
          child: Container(
            child: ListView.builder(
              itemCount: teacherList.length,
              itemBuilder: (BuildContext context, int index) {
//                DatabaseService.db.verifyFavoriteList(teacherList[index].userId).then((value){
//                  if(value) {
//                    isFavorite = true;
//                  }
//                  else {
//                    isFavorite = false;
//                  }
//                  setState(() {
//                  });
//                });
                return Padding(
                  padding: const EdgeInsets.only(
                      right: 16.0, left: 16.0, bottom: 10.0, top: 10.0),
                  child: teacherList.isNotEmpty
                      ? TeacherItem(
                          teacherClass: teacherList[index],
                          isFavorite: idsList.contains(teacherList[index].userId),
                          function: () {
                            DatabaseService.db.handleFavoriteTap(teacherList[index]);
                          },
                        )
                      : null,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
