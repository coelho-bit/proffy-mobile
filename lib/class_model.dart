class TeacherClass {
  int id;
  String subject;
  num cost;
  int user_id;
  String name;
  String avatar;
  String whatsapp;
  String bio;

  TeacherClass(
      {this.id,
      this.subject,
      this.cost,
      this.bio,
      this.name,
      this.avatar,
      this.user_id,
      this.whatsapp});

  factory TeacherClass.fromApi(Map<String, dynamic> teacherClass) {
    return TeacherClass(
      id: teacherClass["id"],
      subject: teacherClass["subject"],
      cost: teacherClass["cost"],
      user_id: teacherClass["user_id"],
      name: teacherClass["name"],
      avatar: teacherClass["avatar"],
      whatsapp: teacherClass["whatsapp"],
      bio: teacherClass["bio"],
    );
  }
}

class TeacherClassList {
  List<TeacherClass> teacherClassList;

  TeacherClassList({ this.teacherClassList });

  static List<TeacherClass> fromApi(List<dynamic>  teacherList) {
    return teacherList.map((e) => TeacherClass.fromApi(e)).toList();
  }
}