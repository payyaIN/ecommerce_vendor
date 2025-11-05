import 'package:http/http.dart' as http;

import 'package:multi_vendor_webapp/views/utils/import_data.dart';

class SubCategoryController {
  uploadSubCategory({
    required String categoryId,
    required String categoryName,
    required dynamic pickedImage,
    required String subCategoryName,
    required context,
  }) async {
    try {
      // final cloudinary = CloudinaryPublic("dyuxzs1fd", "ffkxodwx");
      final cloudinary = CloudinaryPublic("dnp20kt4r", "ad2puysd");

      CloudinaryResponse imageResponse = await cloudinary.uploadFile(
          CloudinaryFile.fromBytesData(pickedImage,
              identifier: 'pickedImage', folder: 'SubCategoryImages'));

      String image = imageResponse.secureUrl;

      SubCategoryModel subCategoryModel = SubCategoryModel(
        id: '',
        categoryId: categoryId,
        categoryName: categoryName,
        image: image,
        subCategoryName: subCategoryName,
      );

      //id -- auto generated
      var uri = subCategoryUrl;
      var url = Uri.parse(uri);

      dynamic body = subCategoryModel.toJson();

      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      http.Response response =
          await http.post(url, body: body, headers: headers);

      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: () {
            showSnackber(context, 'Category Uploaded');
          });
    } catch (e) {
      print(e);
    }
  }

  Future<List<SubCategoryModel>> loadSubCategories() async {
    try {
      var uri = subCategoryUrl;

      var url = Uri.parse(uri);
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      http.Response response = await http.get(url, headers: headers);

      print('subcategories: ${response.body}');
      print('response code: ${response.statusCode}');

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        print('response body : $data');

        List<SubCategoryModel> subCategories = data
            .map((subcategory) => SubCategoryModel.fromJson(subcategory))
            .toList();

        return subCategories;
      } else {
        throw Exception('failed to upload Subcategory');
      }
    } catch (e) {
      throw Exception('error loading Subcategory: $e');
    }
  }
}
