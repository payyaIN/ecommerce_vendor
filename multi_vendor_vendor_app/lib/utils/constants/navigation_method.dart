import 'package:multi_vendor_vendor_app/utils/constants/imports.dart';

pushNavigate(BuildContext context, Widget widget) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

pushReplacement(BuildContext context, Widget widget) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

pushRemoveUntil(BuildContext context, Widget widget) {
  return Navigator.pushAndRemoveUntil<dynamic>(
    context,
    MaterialPageRoute<dynamic>(builder: (BuildContext context) => widget),
    (route) => false,
  );
}
