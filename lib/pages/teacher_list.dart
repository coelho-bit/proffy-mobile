import 'package:flutter/material.dart';
import 'package:mobile/colors/colors.dart';
import 'package:mobile/components/teacher_item.dart';
import 'package:mobile/fonts/fontStyles.dart';

class TeacherList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.purple,
          actions: [Image.asset('assets/logo.png')],
        ),
        body: Stack(
          children: [
            Container(
              height: 210.0,
              width: double.infinity,
              color: AppColors.purple,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Proffys\ndisponíveis",
                      style: CustomFontStyles.teacherListTitle,
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        // TODO: implements search
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
                            Icons.keyboard_arrow_down,
                            color: Color(0xffD4C2FF),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0xff9871F5),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 170.0),
              child: Container(
                color: AppColors.background,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 16.0, left: 16.0, bottom: 10.0, top: 10.0),
                      child: TeacherItem(
                        name: "Estevao Coelho",
                        subject: "Matemática",
                        bio:
                            "Entusiasta das melhores tecnologias de química avançada.Apaixonado por explodir coisas em laboratório e por mudar a vida das pessoas através de experiências. Mais de 200.000 pessoas já passaram por uma das minhas explosões.",
                        cost: "R\$ 80.00",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: TabBar(
          indicatorColor: AppColors.purple,
          indicatorWeight: 4.0,
          unselectedLabelStyle: CustomFontStyles.unSelectedTabBarText,
          labelColor: AppColors.purple,
          unselectedLabelColor: Color(0xffC1BCCC),
          tabs: [
            Tab(
              text: "Proffys",
              icon: Image.asset('assets/proffys-tabbar.png'),
            ),
            Tab(
              text: "Favoritos",
              icon: Image.asset('assets/heart-tabbar.png'),
            ),
          ],
        ),
      ),
    );
  }
}
