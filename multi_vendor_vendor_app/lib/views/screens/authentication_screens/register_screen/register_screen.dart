import 'package:multi_vendor_vendor_app/utils/constants/imports.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final VendorAuthController _vendorAuthController = VendorAuthController();

  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late String email;
  late String fullName;
  late String password;

  bool showLoading = false;

  vendorSignUpUser() async {
    setState(() {
      showLoading = true;
    });
    await _vendorAuthController
        .vendorSignUp(
          context: context,
          email: email,
          fullName: fullName,
          password: password,
        )
        .whenComplete(() {
          // _formKey.currentState!.reset(); //reset text form fields
          setState(() {
            showLoading = false;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.loginScaffoldBg,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      registerText(),
                      AppImage(
                        img: ImageData.loginImage,
                        height: 200,
                        width: 200,
                      ),
                      // RegisterFields(),
                      CustomFormField(
                        txtController: emailController,
                        labelText: AppText.emailLabelText,
                        fieldTitle: AppText.emailLabelText,
                        prefImg: AppIconData.loginIcon,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        showSuffixIcon: false,
                        onChanged: (val) {
                          email = val;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your email";
                          } else {
                            return null;
                          }
                        },
                      ),
                      CustomFormField(
                        txtController: fullNameController,
                        labelText: AppText.fullName,
                        fieldTitle: AppText.fullName,
                        obscureText: false,
                        showSuffixIcon: false,
                        prefImg: AppIconData.userIcon,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        onChanged: (val) {
                          fullName = val;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your full name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      CustomFormField(
                        txtController: passwordController,
                        labelText: AppText.passwrdLabelText,
                        fieldTitle: AppText.passwrdLabelText,
                        obscureText: true,
                        showSuffixIcon: true,
                        prefImg: AppIconData.passwrdIcon,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (val) {
                          password = val;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your password";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        showLoading: showLoading,
                        buttonText: AppText.signUpText,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            vendorSignUpUser();
                          }
                          // else {
                          //   showSnackBar(content: '');
                          // }
                        },
                      ),
                      RichTextData(
                        text1: "${AppText.regRichText1} ",
                        text2: AppText.signInText,
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
