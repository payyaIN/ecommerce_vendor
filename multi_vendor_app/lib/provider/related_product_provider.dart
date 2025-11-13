import 'package:multi_vendor_app/utils/constants/imports.dart';

class RelatedProductProvider extends StateNotifier<List<ProductModel>> {
  RelatedProductProvider() : super([]);

  //set the list of products

  void setProducts(List<ProductModel> products) {
    state = products;
  }
}

final relatedProductProvider =
    StateNotifierProvider<RelatedProductProvider, List<ProductModel>>((ref) {
      return RelatedProductProvider();
    });
