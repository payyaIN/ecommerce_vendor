import 'dart:io';

import 'package:multi_vendor_webapp/services/mannage_http_response.dart';
import 'package:multi_vendor_webapp/views/utils/global_variable.dart';
import 'package:multi_vendor_webapp/views/utils/import_data.dart';
import 'package:http/http.dart' as http;

class CategoryController {
  uploadCategoryImage({
    required dynamic pickedImage,
    required dynamic bannerImage,
    required String name,
    required BuildContext context,
  }) async {
    try {
      // final cloudinary = CloudinaryPublic("dyuxzs1fd", "ffkxodwx");
      final cloudinary = CloudinaryPublic("dnp20kt4r", "ad2puysd");

      CloudinaryResponse imageResponse = await cloudinary.uploadFile(
          CloudinaryFile.fromBytesData(pickedImage,
              identifier: "pickedImage", folder: "categoryImage"));

      print('Image response is : $imageResponse');
      //to get exact imageUrl
      String imageUrl = imageResponse.secureUrl;

      CloudinaryResponse bannerResponse = await cloudinary.uploadFile(
          CloudinaryFile.fromBytesData(bannerImage,
              identifier: "bannerImage", folder: "categoryImage"));

      print('error uploading to cloudiary: $bannerResponse');

      String bannerUrl = bannerResponse.secureUrl;
      //secureUrl - give the exact url of image

      CategoryModel categoryModel =
          CategoryModel(id: '', name: name, image: imageUrl, banner: bannerUrl);
      //id -- auto generated
      var uri = categoryUrl;
      var url = Uri.parse(uri);

      dynamic body = categoryModel.toJson();

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
      print('error uploading to cloudiary: $e');
    }
  }

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
