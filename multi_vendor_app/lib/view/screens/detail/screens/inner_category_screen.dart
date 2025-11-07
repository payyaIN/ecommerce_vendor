import 'package:flutter/material.dart';
import 'package:multi_vendor_app/controllers/subcategory_controller.dart';
import 'package:multi_vendor_app/utils/constants/imports.dart';
import 'package:multi_vendor_app/view/screens/detail/widgets/inner_category_content_widget.dart';
import 'package:multi_vendor_app/view/screens/detail/widgets/inner_header_widget.dart';
import 'package:multi_vendor_app/view/screens/main_screen/nav_screens/account_screen.dart';
import 'package:multi_vendor_app/view/screens/main_screen/nav_screens/cart_screen.dart';

class InnerCatgoryScreen extends StatefulWidget {
  final CategoryModel categoryModel;

  const InnerCatgoryScreen({super.key, required this.categoryModel});

  @override
  _InnerCatgoryScreenState createState() => _InnerCatgoryScreenState();
}

class _InnerCatgoryScreenState extends State<InnerCatgoryScreen> {
  late SubcategoryController subcategoryController = SubcategoryController();
  // final ProductService productService = ProductService();
  // late Future<List<ProductModel>> _productsFuture;
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      InnerCatgoryContentWidget(categoryModel: widget.categoryModel),
      const FavouriteScreen(),
      const CategoryScreen(),
      const StorePage(),
      CartScreen(),
      AccountScreen(),
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 20),
        child: const InnerHeaderWidget(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/home.png", width: 25),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/love.png", width: 25),
            label: "Favorite",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/mart.png", width: 25),
            label: "Stores",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/cart.png", width: 25),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/user.png", width: 25),
            label: "Account",
          ),
        ],
      ),
      body: pages[pageIndex],
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
