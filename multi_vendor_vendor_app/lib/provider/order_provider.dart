import 'package:multi_vendor_vendor_app/utils/constants/imports.dart';

class OrderProvider extends StateNotifier<List<OrderModel>> {
  OrderProvider() : super([]);

  //set the list of Orders
  void setOrders(List<OrderModel> orders) {
    state = orders;
  }
}

final orderProvider = StateNotifierProvider<OrderProvider, List<OrderModel>>((
  ref,
) {
  return OrderProvider();
});
