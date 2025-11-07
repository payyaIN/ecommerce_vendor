import 'package:flutter_riverpod/legacy.dart';
import 'package:multi_vendor_vendor_app/utils/constants/imports.dart';

class VendorProvider extends StateNotifier<VendorModel?> {
  VendorProvider()
    : super(
        VendorModel(
          id: '',
          fullName: '',
          email: '',
          state: '',
          city: '',
          password: '',
          locality: '',
          role: '',
        ),
      );

  VendorModel? get vendorModel => state;

  void setVendor(String vendorJson) {
    state = VendorModel.fromJson(vendorJson);
  }

  void signOut() {
    state = null;
  }
}

final vendorProvider = StateNotifierProvider<VendorProvider, VendorModel?>(
  (ref) => VendorProvider(),
);
