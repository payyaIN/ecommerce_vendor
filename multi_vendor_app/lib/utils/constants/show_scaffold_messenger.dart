import 'package:multi_vendor_app/utils/constants/imports.dart';

showSnackBar({required String content}) {
  return Fluttertoast.showToast(
    msg: content,
    backgroundColor: Colors.black,
    fontSize: 15,
    gravity: ToastGravity.BOTTOM,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
  );
}
