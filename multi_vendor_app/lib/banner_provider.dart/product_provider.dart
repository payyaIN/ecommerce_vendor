import 'package:multi_vendor_app/utils/constants/imports.dart';

class ProductProvider extends StateNotifier<List<ProductModel>> {
  ProductProvider() : super([]);

  //set list of products

  void setProducts(List<ProductModel> productsModel) {
    state = productsModel;
  }
}

final productProvider =
    StateNotifierProvider<ProductProvider, List<ProductModel>>(
      (ref) => ProductProvider(),
    );
