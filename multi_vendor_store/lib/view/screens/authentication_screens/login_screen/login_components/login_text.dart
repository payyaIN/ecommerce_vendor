import 'package:multi_ventor_store/utils/constants/imports.dart';

Widget loginText() {
  return Column(
    children: [
      CustomText(
        text: AppText.loginText,
        style: AppTextStyles.loginToUrAcntStyle,
      ),
      const SizedBox(
        height: 5,
      ),
      CustomText(
        text: AppText.exploreText,
        style: AppTextStyles.loginExploreStyle,
      ),
    ],
  );
}
