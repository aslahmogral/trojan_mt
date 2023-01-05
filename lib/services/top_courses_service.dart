import 'package:http/http.dart' as http;
import 'package:trojan_machinetest/model/topcourses.dart';

class TopCoursesService {
  Future<List<Course>?> getCourses() async {
    try {
      var url = Uri.parse('https://futursity.com/course/api/top_courses');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Course> _model = courseModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
