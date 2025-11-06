import 'package:http/http.dart' as http;
import 'package:multi_vendor_app/utils/constants/imports.dart';

class SubcategoryController {
  Future<List<SubCategoryModel>> getSubCategoriesByCategoryName(
    String categoryName,
  ) async {
    try {
      http.Response response = await http.get(
        Uri.parse("$baseUrl/api/category/$categoryName/subcategories"),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        print("Subcategories are : $data");
        print("Subcategories response : ${response.body}");
        if (data.isNotEmpty) {
          return data
              .map((subcategory) => SubCategoryModel.fromJson(subcategory))
              .toList();
        } else {
          print('Subcategories not found');
          return [];
        }
      } else if (response.statusCode == 404) {
        print('Subcategories not found');

        return [];
      } else {
        print('failed to fetch subcategories');
        return [];
      }
    } catch (e) {
      print('Error fetching categories: $e');
      return [];
    }
  }
}
