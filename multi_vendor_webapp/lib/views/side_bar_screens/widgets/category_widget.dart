import 'package:multi_vendor_webapp/views/utils/import_data.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  late Future<List<CategoryModel>> futureCategories;

  @override
  void initState() {
    super.initState();
    futureCategories = CategoryController().loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
                  shrinkWrap: true,
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    crossAxisCount: 6,
                  ),
                  itemBuilder: (context, index) {
                    final category = categories[index];

                    return Column(
                      children: [
                        Image.network(
                          height: 100,
                          width: 100,
                          category.image,
                        ),
                        Text(category.name)
                        // Text(category.name[0].toUpperCase() +
                        //     category.name.substring(1).toLowerCase()),
                      ],
                    );
                  }),
            );
          }
        });
  }
}
