import 'package:multi_vendor_app/utils/constants/imports.dart';

class SubcategoryProductProvider extends StateNotifier<List<ProductModel>> {
  SubcategoryProductProvider() : super([]);

  //set the list of products
  void setProducts(List<ProductModel> products) {
    state = products;
  }
}

final subcategoryProductProvider =
    StateNotifierProvider<SubcategoryProductProvider, List<ProductModel>>((
      ref,
    ) {
      return SubcategoryProductProvider();
    });
