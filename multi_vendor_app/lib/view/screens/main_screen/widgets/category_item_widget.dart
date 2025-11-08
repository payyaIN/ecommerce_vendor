import 'package:multi_vendor_app/utils/constants/imports.dart';
import 'package:multi_vendor_app/view/screens/detail/screens/inner_category_screen.dart';
import 'package:multi_vendor_app/view/screens/main_screen/widgets/reusable_text_widget.dart';

class CategoryItemWidget extends StatefulWidget {
  const CategoryItemWidget({super.key});

  @override
  State<CategoryItemWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryItemWidget> {
  late Future<List<CategoryModel>> futureCategories;

  @override
  void initState() {
    super.initState();
    futureCategories = CategoryController().loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ReusableTextWidget(title: "Categories", subtitle: 'View All'),
        FutureBuilder(
          future: futureCategories,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No Category'));
            } else {
              final categories = snapshot.data!;
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  final category = categories[index];

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              InnerCatgoryScreen(categoryModel: category),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Image.network(height: 67, width: 77, category.image),
                        Text(
                          category.name,
                          style: GoogleFonts.quicksand(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ],
    );
  }
}
