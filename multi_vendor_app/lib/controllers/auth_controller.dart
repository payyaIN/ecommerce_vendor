import 'package:http/http.dart' as http;
import 'package:multi_vendor_app/models/usermodel.dart';
import 'package:multi_vendor_app/services/mange_response.dart';
import 'package:multi_vendor_app/utils/constants/global_variables.dart';
import 'package:multi_vendor_app/utils/constants/imports.dart';
import 'package:multi_vendor_app/utils/constants/navigation_method.dart';
import 'package:multi_vendor_app/view/screens/main_screen/main_screen.dart';

class AuthController {
  Future<void> signupUser({
    required BuildContext context,
    required String email,
    required String fullName,
    required String password,
  }) async {
    try {
      var uri = signUpUrl;
      var url = Uri.parse(uri);

      User user = User(
        id: '',
        fullName: fullName,
        email: email,
        state: '',
        city: '',
        password: password,
        locality: '',
        token: '',
      );

      Map<String, String> header = {
        'Content-Type': 'application/json; charset=utf-8',
      };

      http.Response response = await http.post(
        url,
        headers: header,
        body: user.toJson(),
      );

      manageHttpResponse(
        response: response,
        onSuccess: () {
          pushNavigate(context, const LoginScreen());
          showSnackBar(content: 'Account created successfully');
        },
      );
    } catch (e) {
      print('error :$e');
      showSnackBar(content: 'Error is : $e');
    }
  }

  Future<void> signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      var uri = signInUrl;
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
        onSuccess: () {
          pushRemoveUntil(context, const MainScreen());
          showSnackBar(content: 'Login successfull');
        },
      );
    } catch (e) {
      print('error is $e');
    }
  }
}
