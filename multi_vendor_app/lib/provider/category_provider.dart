import 'package:multi_vendor_app/utils/constants/imports.dart';

class CategoryProvider extends StateNotifier<List<CategoryModel>> {
  CategoryProvider() : super([]);
  //set the list of categories
  void setCategories(List<CategoryModel> categories) {
    state = categories;
  }
}

final categoryProvider =
    StateNotifierProvider<CategoryProvider, List<CategoryModel>>((ref) {
      return CategoryProvider();
    });
