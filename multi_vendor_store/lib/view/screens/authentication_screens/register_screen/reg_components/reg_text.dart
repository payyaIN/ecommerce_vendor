import 'package:multi_ventor_store/utils/constants/imports.dart';

Widget registerText() {
  return Column(
    children: [
      CustomText(
        text: AppText.registerText,
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
