import 'package:multi_vendor_app/controllers/auth_controller.dart';
import 'package:multi_vendor_app/utils/constants/imports.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final AuthController authController = AuthController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          await authController.signOut(context: context);
        },
        child: Text("Log out"),
      ),
    );
  }
}
