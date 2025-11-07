import 'package:multi_vendor_vendor_app/utils/constants/imports.dart';

class CustomFormField extends StatefulWidget {
  final String fieldTitle;
  bool obscureText;
  bool showSuffixIcon;
  String labelText;
  Function(String)? onChanged;
  final TextEditingController txtController;
  final FormFieldValidator<String> validator;
  final TextInputType? keyboardType;
  String prefImg;
  TextInputAction? textInputAction;
  CustomFormField({
    super.key,
    required this.labelText,
    required this.txtController,
    required this.prefImg,
    this.obscureText = false,
    this.showSuffixIcon = false,
    this.onChanged,
    required this.validator,
    required this.fieldTitle,
    required this.keyboardType,
    this.textInputAction,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              text: widget.fieldTitle,
              style: AppTextStyles.loginExploreStyle,
            ),
          ),
        ),
        TextFormField(
          controller: widget.txtController,
          onChanged: widget.onChanged,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          cursorColor: AppColors.btnGradient1,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            fillColor: Colors.white,
            filled: true,
            labelText: widget.labelText,
            labelStyle: AppTextStyles.labelTextStyle,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(10),
              child: AppImage(img: widget.prefImg, width: 20, height: 20),
            ),
            suffixIcon: widget.showSuffixIcon
                ? InkWell(
                    onTap: () {
                      setState(() {
                        widget.obscureText = !(widget.obscureText);
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: widget.showSuffixIcon == true
                          ? Icon(
                              widget.obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black,
                            )
                          : null,
                    ),
                  )
                : null,
          ),
          validator: widget.validator,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
