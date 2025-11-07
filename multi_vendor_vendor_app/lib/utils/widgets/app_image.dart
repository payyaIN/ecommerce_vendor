import 'package:multi_vendor_vendor_app/utils/constants/imports.dart';

class AppImage extends StatelessWidget {
  double? height;
  double? width;
  Color? color;
  String img;
  BoxFit? fit;
  AppImage({
    required this.img,
    super.key,
    this.fit,
    this.height,
    this.width,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      img,
      width: width,
      height: height,
      color: color,
      fit: fit,
    );
  }
}
