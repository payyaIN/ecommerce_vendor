import 'package:multi_ventor_store/controllers/subcategory_controller.dart';
import 'package:multi_ventor_store/utils/constants/imports.dart';
import 'package:multi_ventor_store/view/screens/main_screen/main_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  CategoryModel? _selectedCategory;
  late Future<List<CategoryModel>> futureCategories;
  List<SubCategoryModel> _subcategories = [];
  final SubcategoryController subcategoryController = SubcategoryController();

  @override
  void initState() {
    super.initState();
    futureCategories = CategoryController().loadCategories();
  }

  Future<void> _loadSubCategories(String categoryName) async {
    final subCategories = await subcategoryController
        .getSubCategoriesByCategoryName(categoryName);
    setState(() {
      _subcategories = subCategories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 20),
        child: const HeaderWidget(),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //left side - Display categories
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey.shade200,
              child: FutureBuilder(
                  future: futureCategories,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('error:${snapshot.error}'));
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Erorr : ${snapshot.error}'),
                      );
                    } else {
                      final categories = snapshot.data!;
                      return ListView.builder(
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            final category = categories[index];
                            return ListTile(
                              onTap: () {
                                setState(() {
                                  _selectedCategory = category;
                                });

                                _loadSubCategories(category.name);
                              },
                              title: Text(
                                category.name,
                                style: GoogleFonts.quicksand(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: _selectedCategory == category
                                      ? Colors.blue
                                      : Colors.black,
                                ),
                              ),
                            );
                          });
                    }
                  }),
            ),
          ),
          //Right side - Display selected category details
          Expanded(
              flex: 5,
              child: _selectedCategory != null
                  ? SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                _selectedCategory!.name,
                                style: GoogleFonts.quicksand(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      _selectedCategory!.banner,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            _subcategories.isNotEmpty
                                ? GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: _subcategories.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            mainAxisSpacing: 4,
                                            crossAxisSpacing: 8,
                                            childAspectRatio: 2 / 3),
                                    itemBuilder: (context, index) {
                                      final subcategory = _subcategories[index];
                                      return Column(
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade200),
                                            child: Center(
                                              child: Image.network(
                                                subcategory.image,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Center(
                                              child: Text(
                                                  subcategory.subCategoryName,
                                                  style: GoogleFonts.quicksand(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                  )))
                                        ],
                                      );
                                    })
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        'No Sub categories',
                                        style: GoogleFonts.quicksand(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.7,
                                        ),
                                      ),
                                    ),
                                  ),
                          ]),
                    )
                  : Container())
        ],
      ),
    );
  }
}
 //       return GestureDetector(
                              //           onTap: () {
                              //             // Navigator.push(context,
                              //             //     MaterialPageRoute(
                              //             //         builder: (context) {
                              //             //   return SubcategoryProductScreen(
                              //             //       subcategory: subcategory);
                              //             // }));
                              //           },
                              //           child: ProfilePage(
                              //               // image: subcategory.image,
                              //               // title: subcategory.subCategoryName),
                              //               ));
                              //     })
                              