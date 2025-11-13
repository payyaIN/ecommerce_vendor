import 'package:multi_vendor_app/utils/constants/imports.dart';

class ProductProvider extends StateNotifier<List<ProductModel>> {
  ProductProvider() : super([]);

  //set the list of products
  void setProducts(List<ProductModel> products) {
    state = products;
  }
}

final productProvider =
    StateNotifierProvider<ProductProvider, List<ProductModel>>((ref) {
      return ProductProvider();
    });
