import 'package:http/http.dart' as http;
import 'package:multi_vendor_vendor_app/models/order_model.dart';
import 'package:multi_vendor_vendor_app/utils/constants/imports.dart';

class OrderController {
  //method to GET orders buy vendor id

  Future<List<OrderModel>> loadOrders({required String vendorId}) async {
    try {
      var uri = loadOrderByVendorId(vendorId);
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
        context: context,
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
