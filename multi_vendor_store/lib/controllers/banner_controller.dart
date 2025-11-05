import 'package:http/http.dart' as http;

import 'package:multi_ventor_store/utils/constants/imports.dart';

class BannerController {
  Future<List<BannerModel>> loadBanners() async {
    try {
      var uri = bannerUrl;
      var url = Uri.parse(uri);
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        //text encoding used is UTF-8 , standard encoding for JSON
        //and handles international characters well.
      };

      http.Response response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        // If response.body contains this JSON string:
        // '[{"id": 1, "title": "Banner 1"}, {"id": 2, "title": "Banner 2"}]'

        // After jsonDecode, data would contain:
        // data = [
        //   {"id": 1, "title": "Banner 1"},
        //   {"id": 2, "title": "Banner 2"}
        // ]

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
