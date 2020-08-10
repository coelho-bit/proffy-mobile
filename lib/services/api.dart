import 'dart:convert';
import 'package:http/http.dart';
import 'package:mobile/class_model.dart';

class ApiServices {

  static Future<List<TeacherClass>> getFilteredProffys(int day, String subject, String time) async {

    String formattedTime = time.split(' ')[0];

    Map<String, String> queryParams = {
      'week_day': day.toString(),
      'subject': subject,
      'time': formattedTime,
    };

    var uri = Uri.http("192.168.0.11:3333", "/classes", queryParams);

    var response = await get(uri);

    return TeacherClassList.fromApi(json.decode(response.body));
  }

}