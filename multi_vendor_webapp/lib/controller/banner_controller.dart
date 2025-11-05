import 'package:multi_vendor_webapp/services/mannage_http_response.dart';
import 'package:multi_vendor_webapp/views/utils/import_data.dart';
import 'package:http/http.dart' as http;

class BannerController {
  uploadBanner({
    required dynamic pickedImage,
    required BuildContext context,
  }) async {
    try {
      // final cloudinary = CloudinaryPublic("dyuxzs1fd", "ffkxodwx");
      final cloudinary = CloudinaryPublic("dnp20kt4r", "ad2puysd");

      CloudinaryResponse imageResponse = await cloudinary.uploadFile(
          CloudinaryFile.fromBytesData(pickedImage,
              identifier: "pickedImage", folder: "BannerImage"));

      print('Image response is : $imageResponse');
      //to get exact imageUrl
      String imageUrl = imageResponse.secureUrl;

      BannerModel bannerModel = BannerModel(id: '', image: imageUrl);

      //creating post method

      var uri = bannerUrl;
      var url = Uri.parse(uri);

      dynamic body = bannerModel.toJson();
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      http.Response response =
          await http.post(url, body: body, headers: headers);

      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: () {
            showSnackber(context, 'Banner Uploaded Successfully');
          });
    } catch (e) {
      print('error is $e');
    }
  }

  Future<List<BannerModel>> loadBanners() async {
    try {
      var uri = bannerUrl;
      var url = Uri.parse(uri);
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      http.Response response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);

        List<BannerModel> banners =
            data.map((banner) => BannerModel.fromJson(banner)).toList();
        return banners;
      } else {
        throw Exception('Failed to load banner');
      }
    } catch (e) {
      throw ('error loading banners : $e');
    }
  }
}
