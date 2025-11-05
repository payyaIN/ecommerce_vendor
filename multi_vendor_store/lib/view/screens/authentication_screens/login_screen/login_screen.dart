import 'package:multi_ventor_store/controllers/auth_controller.dart';
import 'package:multi_ventor_store/utils/constants/imports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwprdController = TextEditingController();

  final AuthController _authController = AuthController();

  late String email;
  late String password;

  bool isLoading = false;

  loginUser() async {
    setState(() {
      isLoading = true;
    });
    await _authController
        .signInUser(context: context, email: email, password: password)
        .whenComplete(() {
      // _formKey.currentState!.reset();
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      loginText(),
                      AppImage(
                          img: ImageData.loginImage, height: 200, width: 200),
                      // const LoginFields(),
                      CustomFormField(
                        txtController: emailController,
                        labelText: AppText.emailLabelText,
                        fieldTitle: 'Email',
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
                        txtController: passwprdController,
                        labelText: AppText.passwrdLabelText,
                        fieldTitle: 'Password',
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
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        showLoading: isLoading,
                        buttonText: AppText.signInText,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            loginUser();
                          } else {
                            return null;
                          }
                        },
                      ),

                      RichTextData(
                        text1: "${AppText.loginRichText1} ",
                        text2: AppText.signUpText,
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterScreen()));
                        },
                      )
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
