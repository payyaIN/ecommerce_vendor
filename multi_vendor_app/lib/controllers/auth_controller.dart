import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:multi_vendor_app/models/usermodel.dart';
import 'package:multi_vendor_app/provider/user_provider.dart';
import 'package:multi_vendor_app/services/mange_response.dart';
import 'package:multi_vendor_app/utils/constants/global_variables.dart';
import 'package:multi_vendor_app/utils/constants/imports.dart';
import 'package:multi_vendor_app/utils/constants/navigation_method.dart';
import 'package:multi_vendor_app/view/screens/main_screen/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

final providerContainer = ProviderContainer();

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

      UserModel user = UserModel(
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
        onSuccess: () async {
          //using shared preferences - storing token and user data
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();

          //extract token from authentication response
          String token = jsonDecode(response.body)['token'];

          //storing the auth token securely in Shared pref
          await sharedPreferences.setString('auth_token', token);

          //encode the user data recivied from backend as json
          //'user' - userwithoutpassword
          final userJson = jsonEncode(jsonDecode(response.body)['user']);

          //update the app state with user data using provider
          providerContainer.read(userProvider.notifier).setUser(userJson);

          //store the data in sharedpreferences for future use
          await sharedPreferences.setString('user', userJson);

          pushRemoveUntil(context, const MainScreen());
          showSnackBar(content: 'Login successfull');
        },
      );
    } catch (e) {
      print('error is $e');
    }
  }

  //signout
  Future<void> signOut({required BuildContext context}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.remove('auth_token');
      await prefs.remove('user');

      providerContainer.read(userProvider.notifier).signOut();

      if (context.mounted) {
        pushRemoveUntil(context, const LoginScreen());
      }
      showSnackBar(content: 'User Signout Successfull');
    } catch (e) {
      showSnackBar(content: "Error Signing out:$e");
    }
  }
}
