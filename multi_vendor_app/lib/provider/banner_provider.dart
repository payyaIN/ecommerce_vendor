import 'package:multi_vendor_app/utils/constants/imports.dart';

class BannerProvider extends StateNotifier<List<BannerModel>> {
  BannerProvider() : super([]);

  //set the list of banners
  void setBanners(List<BannerModel> banners) {
    state = banners;
  }
}

final bannerProvider = StateNotifierProvider<BannerProvider, List<BannerModel>>(
  (ref) {
    return BannerProvider();
  },
);
