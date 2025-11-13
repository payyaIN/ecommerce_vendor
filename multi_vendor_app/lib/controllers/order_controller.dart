import 'package:http/http.dart' as http;
import 'package:multi_vendor_app/models/order_model.dart';
import 'package:multi_vendor_app/utils/constants/imports.dart';

class OrderController {
  //upload orders

  uploadOrders({
    required String id,
    required String fullName,
    required String email,
    required String state,
    required String city,
    required String locality,
    required String productName,
    required int productPrice,
    required int quantity,
    required String category,
    required String image,
    required String buyerId,
    required String vendorId,
    required bool processing,
    required bool delivered,
    required context,
  }) async {
    try {
      var uri = uploadOrdersUrl;
      var url = Uri.parse(uri);

      final OrderModel order = OrderModel(
        id: id,
        fullName: fullName,
        email: email,
        state: state,
        city: city,
        locality: locality,
        productName: productName,
        productPrice: productPrice,
        quantity: quantity,
        category: category,
        image: image,
        buyerId: buyerId,
        vendorId: vendorId,
        processing: processing,
        delivered: delivered,
      );
      Map<String, String> header = {
        'Content-Type': 'application/json; charset=utf-8',
      };

      http.Response response = await http.post(
        url,
        headers: header,
        body: order.toJson(),
      );

      manageHttpResponse(
        response: response,
        onSuccess: () {
          showSnackBar(content: 'Order Placed Successfully');
        },
      );
    } catch (e) {
      print('Error creating orders :$e');
      showSnackBar(content: 'Error creating orders : $e');
    }
  }

  //method to GET orders buy buyer id

  Future<List<OrderModel>> loadOrders({required String buyerId}) async {
    try {
      var uri = loadOrderById(buyerId);
      var url = Uri.parse(uri);
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      http.Response response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);

        List<OrderModel> orders = data
            .map((ordr) => OrderModel.fromJson(ordr))
            .toList();
        return orders;
      } else {
        throw Exception('Failed to load orders');
      }
    } catch (e) {
      throw ('error loading orders : $e');
    }
  }

  //delete order by id
  Future<void> deleteOrder({
    required String id,
    required BuildContext context,
  }) async {
    try {
      var uri = deleteOrderById(id);
      var url = Uri.parse(uri);
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };
      http.Response response = await http.delete(url, headers: headers);

      manageHttpResponse(
        response: response,
        onSuccess: () {
          showSnackBar(content: 'Order Deleted Successfully');
        },
      );
    } catch (e) {
      showSnackBar(content: 'error loading orders : $e');
    }
  }
}
