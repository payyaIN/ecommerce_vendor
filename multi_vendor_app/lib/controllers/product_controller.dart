import 'package:http/http.dart' as http;
import 'package:multi_vendor_app/utils/constants/imports.dart';

class ProductController {
  Future<List<ProductModel>> loadPopularProducts() async {
    try {
      var uri = productUrl;
      var url = Uri.parse(uri);
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      http.Response response = await http.get(url, headers: headers);

      print("product response : ${response.body}");
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body) as List<dynamic>;

        List<ProductModel> products = data
            .map((prdct) => ProductModel.fromMap(prdct as Map<String, dynamic>))
            .toList();
        // fromJson(prdct))
        // .toList();
        return products;
      } else {
        throw Exception('Failed to load product');
      }
    } catch (e) {
      print("error loading products : $e");
      throw ('error loading products : $e');
    }
  }

  // //load product by category function
  //   Future<List<ProductModel>> loadProductByCategory(String category) async {
  //     try {
  //       http.Response response = await http.get(
  //         Uri.parse('$uri/api/products-by-category/$category'),
  //         headers: <String, String>{
  //           'Content-Type': 'application/json; chartset=UTF-8 ',
  //         },
  //       );
  //       if (response.statusCode == 200) {
  //         //Decode the json response body into a list  of dynamic object
  //         final List<dynamic> data = json.decode(response.body) as List<dynamic>;
  //         //map each items in the list to product model object which we can use

  //         List<ProductModel> products = data
  //             .map((product) => ProductModel.fromMap(product as Map<String, dynamic>))
  //             .toList();
  //         return products;
  //       } else if (response.statusCode == 404) {
  //         return [];
  //       } else {
  //         //if status code is not 200 , throw an execption   indicating failure to load the popular products
  //         throw Exception('Failed to load popular products');
  //       }
  //     } catch (e) {
  //       throw Exception('Error loading product : $e');
  //     }
  //   }

  //   //display related products by subcategory
  //   Future<List<ProductModel>> loadRelatedProductsBySubcategory(
  //       String productId) async {
  //     try {
  //       http.Response response = await http.get(
  //         Uri.parse('$uri/api/related-products-by-subcategory/$productId'),
  //         headers: <String, String>{
  //           'Content-Type': 'application/json; chartset=UTF-8 ',
  //         },
  //       );
  //       if (response.statusCode == 200) {
  //         //Decode the json response body into a list  of dynamic object
  //         final List<dynamic> data = json.decode(response.body) as List<dynamic>;
  //         //map each items in the list to product model object which we can use

  //         List<ProductModel> relatedProducts = data
  //             .map((product) => ProductModel.fromMap(product as Map<String, dynamic>))
  //             .toList();
  //         return relatedProducts;
  //       } else if (response.statusCode == 404) {
  //         return [];
  //       } else {
  //         //if status code is not 200 , throw an execption   indicating failure to load the popular products
  //         throw Exception('Failed to load related products');
  //       }
  //     } catch (e) {
  //       throw Exception('Error related product : $e');
  //     }
  //   }

  //   //method to get the top 10 highest-rated products
  //   Future<List<ProductModel>> loadTopRatedProduct() async {
  //     try {
  //       http.Response response = await http.get(
  //         Uri.parse('$uri/api/top-rated-products'),
  //         headers: <String, String>{
  //           'Content-Type': 'application/json; chartset=UTF-8 ',
  //         },
  //       );

  //       if (response.statusCode == 200) {
  //         //Decode the json response body into a list  of dynamic object
  //         final List<dynamic> data = json.decode(response.body) as List<dynamic>;
  //         //map each items in the list to product model object which we can use

  //         List<ProductModel> topRatedProducts = data
  //             .map((product) => ProductModel.fromMap(product as Map<String, dynamic>))
  //             .toList();
  //         return topRatedProducts;
  //       } else if (response.statusCode == 404) {
  //         return [];
  //       } else {
  //         //if status code is not 200 , throw an execption   indicating failure to load the popular products
  //         throw Exception('Failed to load top Rated  products');
  //       }
  //     } catch (e) {
  //       throw Exception('Error related product : $e');
  //     }
  //   }

  //   Future<List<ProductModel>> loadProductsBySubcategory(String subCategory) async {
  //     try {
  //       http.Response response = await http.get(
  //         Uri.parse('$uri/api/products-by-subcategory/$subCategory'),
  //         headers: <String, String>{
  //           'Content-Type': 'application/json; chartset=UTF-8 ',
  //         },
  //       );
  //       print('subcategory product response..${response.body}');
  //       if (response.statusCode == 200) {
  //         //Decode the json response body into a list  of dynamic object
  //         final List<dynamic> data = json.decode(response.body) as List<dynamic>;
  //         //map each items in the list to product model object which we can use

  //         List<ProductModel> relatedProducts = data
  //             .map((product) => ProductModel.fromMap(product as Map<String, dynamic>))
  //             .toList();
  //         return relatedProducts;
  //       } else if (response.statusCode == 404) {
  //         return [];
  //       } else {
  //         //if status code is not 200 , throw an execption   indicating failure to load the popular products
  //         throw Exception('Failed to load subcategory products');
  //       }
  //     } catch (e) {
  //       throw Exception('Error subcategory product : $e');
  //     }
  //   }

  //   //Method to search for products by name of description
  //   Future<List<ProductModel>> searchProducts(String query) async {
  //     try {
  //       http.Response response = await http.get(
  //         Uri.parse('$uri/api/search-products?query=$query'),
  //         headers: <String, String>{
  //           'Content-Type': 'application/json; chartset=UTF-8 ',
  //         },
  //       );
  //       print('subcategory product response..${response.body}');
  //       if (response.statusCode == 200) {
  //         //Decode the json response body into a list  of dynamic object
  //         final List<dynamic> data = json.decode(response.body) as List<dynamic>;
  //         //map each items in the list to product model object which we can use

  //         List<ProductModel> searchedProducts = data
  //             .map((product) => ProductModel.fromMap(product as Map<String, dynamic>))
  //             .toList();
  //         return searchedProducts;
  //       } else if (response.statusCode == 404) {
  //         return [];
  //       } else {
  //         //if status code is not 200 , throw an execption   indicating failure to load the popular products
  //         throw Exception('Failed to load searched products');
  //       }
  //     } catch (e) {
  //       throw Exception('Error Loading searched Products : $e');
  //     }
  //   }

  //   Future<List<ProductModel>> loadVendorProducts(String vendorId) async {
  //     try {
  //       http.Response response = await http.get(
  //         Uri.parse('$uri/api/products/vendor/$vendorId'),
  //         headers: <String, String>{
  //           'Content-Type': 'application/json; chartset=UTF-8 ',
  //         },
  //       );
  //       print('subcategory product response..${response.body}');
  //       if (response.statusCode == 200) {
  //         //Decode the json response body into a list  of dynamic object
  //         final List<dynamic> data = json.decode(response.body) as List<dynamic>;
  //         //map each items in the list to product model object which we can use

  //         List<ProductModel> vendorProducts = data
  //             .map((product) => ProductModel.fromMap(product as Map<String, dynamic>))
  //             .toList();
  //         return vendorProducts;
  //       } else if (response.statusCode == 404) {
  //         return [];
  //       } else {
  //         //if status code is not 200 , throw an execption   indicating failure to load the popular products
  //         throw Exception('Failed to load vendors products');
  //       }
  //     } catch (e) {
  //       throw Exception('Error vendors product : $e');
  //     }
  //   }
}
