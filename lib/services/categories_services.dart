import 'package:http/http.dart' as http;
import 'package:trojan_machinetest/model/category_model.dart';

class CategoriesServices {
  Future<List<Categories>?> getCategories() async {
    try {
      var url = Uri.parse('https://futursity.com/course/api/categories');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Categories> _model = categoriesModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}