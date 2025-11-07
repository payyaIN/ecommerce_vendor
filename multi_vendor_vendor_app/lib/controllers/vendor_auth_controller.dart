import 'package:http/http.dart' as http;

import 'package:multi_vendor_vendor_app/utils/constants/imports.dart';

final providerContainer = ProviderContainer();

class VendorAuthController {
  Future<void> vendorSignUp({
    required String fullName,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      VendorModel vendorModel = VendorModel(
        id: '',
        fullName: fullName,
        email: email,
        state: '',
        city: '',
        password: password,
        locality: '',
        role: '',
      );

      var uri = vendorSignUpUrl;
      var url = Uri.parse(uri);

      Map<String, String> header = {
        'Content-Type': 'application/json; charset=utf-8',
      };

      http.Response response = await http.post(
        url,
        body: vendorModel.toJson(),
        headers: header,
      );
      manageHttpResponse(
        response: response,
        onSuccess: () {
          pushRemoveUntil(context, LoginScreen());
          showSnackBar(content: 'Vendor Created Successfully');
        },
      );
    } catch (e) {
      showSnackBar(content: 'Error in creating vendor : $e');
    }
  }

  Future<void> vendorSignInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      var uri = vendorSignInUrl;
      var url = Uri.parse(uri);

      Map<String, String> header = {
        'Content-Type': 'application/json; charset=utf-8',
      };

      var body = jsonEncode({'email': email, 'password': password});

      http.Response response = await http.post(
        url,
        headers: header,
        body: body,
      );

      manageHttpResponse(
        response: response,
        onSuccess: () async {
          SharedPreferences preferences = await SharedPreferences.getInstance();

          String token = json.decode(response.body)['token'];
          print("vendor : $token");
          await preferences.setString('auth_token', token);

          final vendorJson = json.encode(json.decode(response.body)['vendor']);

          providerContainer.read(vendorProvider.notifier).setVendor(vendorJson);

          await preferences.setString('vendor', vendorJson);
          pushRemoveUntil(context, MainVendorScreen());
          showSnackBar(content: 'Vendor Created Successfully');
        },
      );
    } catch (e) {
      showSnackBar(content: 'Vendor Signin Failed : $e');
    }
  }
}
