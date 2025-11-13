import 'package:multi_vendor_app/utils/constants/imports.dart';

class TopRatedProductProvider extends StateNotifier<List<ProductModel>> {
  TopRatedProductProvider() : super([]);

  //set the list of products
  void setProducts(List<ProductModel> products) {
    state = products;
  }
}

final topRatedProductProvider =
    StateNotifierProvider<TopRatedProductProvider, List<ProductModel>>((ref) {
      return TopRatedProductProvider();
    });
