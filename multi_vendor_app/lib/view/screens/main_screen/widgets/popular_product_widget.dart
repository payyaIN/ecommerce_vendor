import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_vendor_app/controllers/product_controller.dart';
import 'package:multi_vendor_app/utils/constants/imports.dart';

class PopularProductWidget extends ConsumerStatefulWidget {
  const PopularProductWidget({super.key});

  @override
  ConsumerState<PopularProductWidget> createState() =>
      _PopularProductWidgetState();
}

class _PopularProductWidgetState extends ConsumerState<PopularProductWidget> {
  //a future that will hold the list of popular products
  late Future<List<ProductModel>> futurePopularProducts;

  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    futurePopularProducts = ProductController().loadPopularProducts();
    // final products = ref.read(productProvider);
    // if (products.isEmpty) {
    //   _fetchProduct();
    // } else {
    //   setState(() {
    //     isLoading = false;
    //   });
    // }
  }

  // Future<void> _fetchProduct() async {
  //   final ProductController productController = ProductController();
  //   try {
  //     final products = await productController.loadPopularProducts();
  //     ref.read(productProvider.notifier).setProducts(products);
  //   } catch (e) {
  //     print("$e");
  //   } finally {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // final products = ref.watch(productProvider);
    // return SizedBox(
    //   height: 250,
    //   child: isLoading
    //       ? const Center(child: CircularProgressIndicator(color: Colors.blue))
    //       : ListView.builder(
    //           scrollDirection: Axis.horizontal,
    //           itemCount: products.length,
    //           itemBuilder: (context, index) {
    //             final product = products[index];
    //             return ProductItemWidget(product: product);
    //           },
    //         ),
    // );
    return FutureBuilder<List<ProductModel>>(
      future: futurePopularProducts,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No Popular Product'));
        } else {
          final products = snapshot.data!;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              // return ProductItemWidget(product: product);
              return Text(product.productName);
            },
          );
        }
      },
    );
  }
}
