import 'package:multi_vendor_app/utils/constants/imports.dart';

class InnerCatgoryContentWidget extends StatefulWidget {
  final CategoryModel categoryModel;

  const InnerCatgoryContentWidget({super.key, required this.categoryModel});

  @override
  _InnerCatgoryContentWidgetState createState() =>
      _InnerCatgoryContentWidgetState();
}

class _InnerCatgoryContentWidgetState extends State<InnerCatgoryContentWidget> {
  late Future<List<SubCategoryModel>> _subcategoryModel;
  late SubcategoryController subcategoryController = SubcategoryController();
  // final ProductService productService = ProductService();
  late Future<List<ProductModel>> futureProducts;

  @override
  void initState() {
    super.initState();
    _subcategoryModel = subcategoryController.getSubCategoriesByCategoryName(
      widget.categoryModel.name,
    );
    futureProducts = ProductController().loadProductByCategory(
      widget.categoryModel.name,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            InnerBannerWidget(image: widget.categoryModel.banner),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Shop By Categories',
                  style: GoogleFonts.quicksand(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    // letterSpacing: 1.7,
                  ),
                ),
              ),
            ),
            FutureBuilder(
              future: _subcategoryModel,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No Category'));
                } else {
                  final subCategories = snapshot.data!;

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,

                    child: Column(
                      children: List.generate((subCategories.length / 7).ceil(), (
                        setIndex,
                      ) {
                        //for each row, calculate the startting and ending indices
                        final start = setIndex * 7;
                        final end = (setIndex + 1) * 7;
                        //Create a padding widget to add spacing arround the row
                        return Padding(
                          padding: EdgeInsets.all(8.9),
                          child: Row(
                            //create a row of the subcategory tiles
                            children: subCategories
                                .sublist(
                                  start,
                                  end > subCategories.length
                                      ? subCategories.length
                                      : end,
                                )
                                .map(
                                  (subCategory) => SubCategoryTitleWidget(
                                    image: subCategory.image,
                                    title: subCategory.subCategoryName,
                                  ),
                                )
                                .toList(),
                          ),
                        );
                      }),
                    ),
                  );
                }
              },
            ),
            const ReusableTextWidget(
              title: 'Popular Product',
              subtitle: 'View all',
            ),
            FutureBuilder(
              future: futureProducts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('No product under this category'),
                  );
                } else {
                  final products = snapshot.data;
                  return SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products!.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return ProductItemWidget(productModel: product);
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
//       body: FutureBuilder<List<ProductModel>>(
//         future: _productsFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return _buildShimmerProducts();
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.data == null || snapshot.data!.isEmpty) {
//             return Center(
//               child: Text(
//                 'No products found in\n ${widget.categoryName}',
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.lato(
//                   fontSize: 19,
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: 1.9,
//                 ),
//               ),
//             );
//           } else {
//             return ListView.builder(
//               itemCount: (snapshot.data!.length / 3).ceil(),
//               itemBuilder: (context, index) {
//                 final int startIndex = index * 3;
//                 final int endIndex = startIndex + 3;
//                 final bool hasMoreItems = endIndex <= snapshot.data!.length;

//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         for (
//                           int i = startIndex;
//                           i < endIndex && i < snapshot.data!.length;
//                           i++
//                         )
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => ProductDetailScreen(
//                                     product: snapshot.data![i],
//                                   ),
//                                 ),
//                               );
//                             },
//                             child: ProductItemWidget(
//                               productModel: snapshot.data![i],
//                             ),
//                           ),
//                         if (!hasMoreItems)
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width / 3,
//                           ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }

//   Widget _buildShimmerProducts() {
//     return ListView.builder(
//       itemCount: 6, // Placeholder for shimmer effect
//       itemBuilder: (context, index) {
//         return Shimmer.fromColors(
//           baseColor: Colors.grey[300]!,
//           highlightColor: Colors.grey[100]!,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   for (int i = 0; i < 3; i++)
//                     Container(
//                       width: MediaQuery.of(context).size.width / 3,
//                       height: MediaQuery.of(context).size.width / 3,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
