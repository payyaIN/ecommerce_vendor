import 'package:http/http.dart' as http;
import 'package:multi_ventor_store/utils/constants/imports.dart';

class SubcategoryController {
  Future<List<SubCategoryModel>> getSubCategoriesByCategoryName(
      String categoryName) async {
    try {
      http.Response response = await http.get(
        Uri.parse("$baseUrl/api/category/$categoryName/subcategories"),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8'
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        if (data.isNotEmpty) {
          return data
              .map((subcategory) => SubCategoryModel.fromJson(subcategory))
              .toList();
        } else {
          return [];
        }
      } else if (response.statusCode == 404) {
        return [];
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
