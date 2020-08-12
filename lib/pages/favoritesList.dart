import 'package:flutter/material.dart';
import 'package:mobile/colors/colors.dart';
import 'package:mobile/components/teacher_item.dart';
import 'package:mobile/database/database_services.dart';
import 'package:mobile/fonts/fontStyles.dart';

import '../class_model.dart';

class FavoriteList extends StatefulWidget {
  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList>  {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200.0,
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
                  "Meus Proffys\nfavoritos",
                  style: CustomFontStyles.teacherListTitle,
                ),
                SizedBox(
                  height: 24.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 100.0),
          child: FutureBuilder(
              future: DatabaseService.db.getFavoritesTeacherClasses(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<TeacherClass>> snapshot) {
                return snapshot.hasData
                    ? Container(
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  right: 16.0,
                                  left: 16.0,
                                  bottom: 10.0,
                                  top: 10.0),
                              child: TeacherItem(
                                teacherClass: snapshot.data[index],
                                isFavorite: true,
                                function: () {
                                  DatabaseService.db.removeFromFavorites(
                                      snapshot.data[index].userId);
                                  setState(() {

                                  });
                                },
                              ),
                            );
                          },
                        ),
                      )
                    : CircularProgressIndicator();
              }),
        ),
      ],
    );
  }

}
