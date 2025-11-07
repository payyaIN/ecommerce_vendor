import 'package:multi_vendor_vendor_app/utils/constants/imports.dart';

class RichTextData extends StatefulWidget {
  String text1;
  String text2;
  VoidCallback onTap;
  RichTextData({
    required this.text1,
    required this.text2,
    required this.onTap,
    super.key,
  });

  @override
  State<RichTextData> createState() => _RichTextDataState();
}

class _RichTextDataState extends State<RichTextData> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: widget.text1,
            style: AppTextStyles.loginRichTextStyle1,
          ),
          TextSpan(
            text: widget.text2,
            style: AppTextStyles.loginRichTextStyle2,
            recognizer: TapGestureRecognizer()..onTap = widget.onTap,
          ),
        ],
      ),
    );
  }
}
