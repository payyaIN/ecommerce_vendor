import 'package:multi_vendor_app/utils/constants/imports.dart';

class CategoryProvider extends StateNotifier<List<CategoryModel>> {
  CategoryProvider() : super([]);

  //set list of orders
  void setCategories(List<CategoryModel> categoryModel) {
    state = categoryModel;
  }
}

final categoryProvider =
    StateNotifierProvider<CategoryProvider, List<CategoryModel>>(
      (ref) => CategoryProvider(),
    );
