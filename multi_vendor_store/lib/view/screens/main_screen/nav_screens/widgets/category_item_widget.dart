import 'package:multi_ventor_store/utils/constants/imports.dart';
import 'package:multi_ventor_store/view/screens/main_screen/nav_screens/widgets/reusable_text_widget.dart';

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
                return Center(
                  child: Text('error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('No Category'),
                );
              } else {
                final categories = snapshot.data!;
                return SizedBox(
                  height: 400,
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: categories.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        crossAxisCount: 4,
                      ),
                      itemBuilder: (context, index) {
                        final category = categories[index];

                        return Column(
                          children: [
                            Image.network(
                              height: 67,
                              width: 77,
                              category.image,
                            ),
                            Text(
                              category.name,
                              style: GoogleFonts.quicksand(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        );
                      }),
                );
              }
            }),
      ],
    );
  }
}
