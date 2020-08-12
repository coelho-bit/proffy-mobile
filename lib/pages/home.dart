import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/colors/colors.dart';
import 'package:mobile/fonts/fontStyles.dart';
import 'package:mobile/pages/teachers_list.dart';
import 'favoritesList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
        body: TabBarView(
          children: [
            TeachersList(),
            FavoriteList(),
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
