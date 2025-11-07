import 'package:multi_vendor_vendor_app/utils/constants/imports.dart';

class LoginFields extends StatefulWidget {
  const LoginFields({super.key});

  @override
  State<LoginFields> createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwprdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomFormField(
          txtController: emailController,
          labelText: AppText.emailLabelText,
          fieldTitle: 'Email',
          prefImg: AppIconData.loginIcon,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          obscureText: false,
          showSuffixIcon: false,
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
          validator: (value) {
            if (value!.isEmpty) {
              return "Enter your password";
            } else {
              return null;
            }
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
