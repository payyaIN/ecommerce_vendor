import 'package:http/http.dart' as http;
import 'package:multi_ventor_store/utils/constants/imports.dart';

void manageHttpResponse({
  required http.Response response, //http response from request

  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200: //successfull
      onSuccess();
      break;
    case 400: //badrequest
      showSnackBar(content: json.decode(response.body)['msg']);
      break;
    case 500: //internal server error
      showSnackBar(content: json.decode(response.body)['msg']);
      break;
    case 201: //resource created successfully
      onSuccess();
  }
}
