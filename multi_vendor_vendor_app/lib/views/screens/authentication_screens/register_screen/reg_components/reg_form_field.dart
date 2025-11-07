// import 'package:multi_ventor_store/utils/constants/imports.dart';

// class RegisterFields extends StatefulWidget {
//   RegisterFields({super.key});

//   @override
//   State<RegisterFields> createState() => _RegisterFieldsState();
// }

// class _RegisterFieldsState extends State<RegisterFields> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController fullNameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CustomFormField(
//           txtController: emailController,
//           labelText: AppText.emailLabelText,
//           fieldTitle: AppText.emailLabelText,
//           prefImg: IconsData.loginIcon,
//           keyboardType: TextInputType.emailAddress,
//           textInputAction: TextInputAction.next,
//           obscureText: false,
//           showSuffixIcon: false,
//           onChanged: (val) {
//             email = val;
//           },
//           validator: (value) {
//             if (value!.isEmpty) {
//               return "Enter your email";
//             } else {
//               return null;
//             }
//           },
//         ),
//         CustomFormField(
//           txtController: fullNameController,
//           labelText: AppText.fullName,
//           fieldTitle: AppText.fullName,
//           obscureText: false,
//           showSuffixIcon: false,
//           prefImg: IconsData.userIcon,
//           textInputAction: TextInputAction.next,
//           keyboardType: TextInputType.name,
//           onChanged: (val) {
//             fullName = val;
//           },
//           validator: (value) {
//             if (value!.isEmpty) {
//               return "Enter your full name";
//             } else {
//               return null;
//             }
//           },
//         ),
//         CustomFormField(
//           txtController: passwordController,
//           labelText: AppText.passwrdLabelText,
//           fieldTitle: AppText.passwrdLabelText,
//           obscureText: true,
//           showSuffixIcon: true,
//           prefImg: IconsData.passwrdIcon,
//           textInputAction: TextInputAction.done,
//           keyboardType: TextInputType.emailAddress,
//           onChanged: (val) {
//             password = val;
//           },
//           validator: (value) {
//             if (value!.isEmpty) {
//               return "Enter your password";
//             } else {
//               return null;
//             }
//           },
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//       ],
//     );
//   }
// }
