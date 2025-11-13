import 'package:multi_vendor_app/utils/constants/imports.dart';

final subcategoryProvider =
    StateNotifierProvider<SubcategoryNotifier, List<SubCategoryModel>>((ref) {
      return SubcategoryNotifier();
    });

class SubcategoryNotifier extends StateNotifier<List<SubCategoryModel>> {
  SubcategoryNotifier() : super([]);

  void setSubcategories(List<SubCategoryModel> subcategories) {
    state = subcategories;
  }
}
