import 'package:mobile/database/database_services.dart';

class TeacherClass {
  int id;
  String subject;
  num cost;
  int userId;
  String name;
  String avatar;
  String whatsapp;
  String bio;
  bool isFavorite;

  TeacherClass({this.id,
    this.subject,
    this.cost,
    this.bio,
    this.name,
    this.avatar,
    this.userId,
    this.whatsapp,
    this.isFavorite});

  factory TeacherClass.fromMap(Map<String, dynamic> teacherClass) {
    bool isFavorite;
    DatabaseService.db.verifyFavoriteList(teacherClass["user_id"]).then((
        value) => isFavorite = value);

    return TeacherClass(
      id: teacherClass["id"],
      subject: teacherClass["subject"],
      cost: teacherClass["cost"],
      userId: teacherClass["user_id"],
      name: teacherClass["name"],
      avatar: teacherClass["avatar"],
      whatsapp: teacherClass["whatsapp"],
      bio: teacherClass["bio"],
      isFavorite: isFavorite ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseService.COLUMN_NAME: id,
      DatabaseService.COLUMN_USER_ID: userId,
      DatabaseService.COLUMN_NAME: name,
      DatabaseService.COLUMN_SUBJECT: subject,
      DatabaseService.COLUMN_AVATAR: avatar,
      DatabaseService.COLUMN_BIO: bio,
      DatabaseService.COLUMN_COST: cost,
      DatabaseService.COLUMN_WHATSAPP: whatsapp,
    };

    return map;
  }
}

class TeacherClassList {
  List<TeacherClass> teacherClassList;

  TeacherClassList({ this.teacherClassList });

  static List<TeacherClass> fromApi(List<dynamic> teacherList) {
    return teacherList.map((e) => TeacherClass.fromMap(e)).toList();
  }
}