import 'package:multi_ventor_store/utils/constants/imports.dart';
import 'package:http/http.dart' as http;

class CategoryController {
  Future<List<CategoryModel>> loadCategories() async {
    try {
      var uri = categoryUrl;
      var url = Uri.parse(uri);
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      http.Response response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);

        List<CategoryModel> categories =
            data.map((catgry) => CategoryModel.fromJson(catgry)).toList();
        return categories;
      } else {
        throw Exception('Failed to load banner');
      }
    } catch (e) {
      throw ('error loading banners : $e');
    }
  }
}
