import 'package:multi_vendor_vendor_app/utils/constants/imports.dart';

class AppTextStyles {
  static TextStyle loginToUrAcntStyle = GoogleFonts.getFont(
    'Lato',
    color: AppColors.loginTourAcntColor,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.2,
    fontSize: 23,
  );
  static TextStyle snackBarTextStyle = GoogleFonts.getFont(
    'Lato',
    color: Colors.white,
    fontWeight: FontWeight.normal,
    fontSize: 23,
  );
  static TextStyle loginExploreStyle = GoogleFonts.getFont(
    'Lato',
    color: AppColors.loginTourAcntColor,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.2,
    fontSize: 12,
  );
  static TextStyle labelTextStyle = GoogleFonts.getFont(
    'Nunito Sans',
    color: AppColors.loginTourAcntColor,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.1,
    fontSize: 14,
  );
  static TextStyle buttonTextStyle = GoogleFonts.getFont(
    'Lato',
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static TextStyle loginRichTextStyle1 = GoogleFonts.roboto(
    letterSpacing: 1,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static TextStyle loginRichTextStyle2 = GoogleFonts.roboto(
    color: AppColors.btnGradient4,
    fontWeight: FontWeight.bold,
  );
}
