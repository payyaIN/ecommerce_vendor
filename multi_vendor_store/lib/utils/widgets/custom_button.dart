import 'package:multi_ventor_store/utils/constants/imports.dart';

class CustomButton extends StatefulWidget {
  String buttonText;
  VoidCallback onPressed;
  bool? showLoading;
  CustomButton(
      {required this.buttonText,
      this.showLoading = false,
      required this.onPressed,
      super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: widget.onPressed,
          child: Stack(
            children: [
              Container(
                height: 50,
                width: 319,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    gradient: LinearGradient(colors: [
                      AppColors.btnGradient1,
                      AppColors.btnGradient2,
                    ])),
                child: widget.showLoading == false
                    ? Center(
                        child: CustomText(
                          text: widget.buttonText,
                          style: AppTextStyles.buttonTextStyle,
                        ),
                      )
                    : const Center(
                        child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      )),
              ),
              PositionedWidget(
                  left: 278,
                  top: 19,
                  opacity: 0.5,
                  height: 60,
                  width: 60,
                  color: AppColors.btnGradient4,
                  borderWidth: 12,
                  borderRadius: 30),
              PositionedWidget(
                  left: 260,
                  top: 29,
                  opacity: 0.5,
                  height: 10,
                  width: 10,
                  color: AppColors.btnGradient3,
                  borderWidth: 3,
                  borderRadius: 5),
              PositionedWidget(
                  left: 311,
                  top: 36,
                  opacity: 0.3,
                  height: 5,
                  width: 5,
                  color: Colors.white,
                  borderRadius: 3),
              PositionedWidget(
                  left: 281,
                  top: -10,
                  opacity: 0.3,
                  height: 20,
                  width: 20,
                  color: Colors.white,
                  borderRadius: 10),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
