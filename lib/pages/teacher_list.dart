import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/colors/colors.dart';
import 'package:mobile/components/filter_container.dart';
import 'package:mobile/components/teacher_item.dart';
import 'package:mobile/fonts/fontStyles.dart';

import '../class_model.dart';

class TeacherList extends StatefulWidget {
  @override
  _TeacherListState createState() => _TeacherListState();
}

class _TeacherListState extends State<TeacherList> {
  bool isFilterVisible = true;
  List<TeacherClass> teacherList = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.purple,
          actions: [Image.asset('assets/logo.png')],
        ),
        body: Stack(
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
                    return Padding(
                        padding: const EdgeInsets.only(
                            right: 16.0, left: 16.0, bottom: 10.0, top: 10.0),
                        child: teacherList.isNotEmpty
                            ? TeacherItem(
                                name: teacherList[index].name,
                                subject: teacherList[index].subject,
                                bio: teacherList[index].bio,
                                cost: "R\$ ${teacherList[index].cost}",
                                imageUrl: teacherList[index].avatar,
                                whatsapp: teacherList[index].whatsapp,
                              )
                            : null);
                  },
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Material(
          color: Colors.white,
          child: TabBar(
            indicatorColor: AppColors.purple,
            indicatorWeight: 4.0,
            unselectedLabelStyle: CustomFontStyles.unSelectedTabBarText,
            labelColor: AppColors.purple,
            unselectedLabelColor: Color(0xffC1BCCC),
            tabs: [
              Tab(
                text: "Proffys",
                icon: SvgPicture.asset('assets/proffys-bar.svg'),
              ),
              Tab(
                text: "Favoritos",
                icon: SvgPicture.asset('assets/favorites-bar.svg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
