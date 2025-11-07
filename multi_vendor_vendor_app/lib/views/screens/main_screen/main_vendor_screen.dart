import 'package:multi_vendor_vendor_app/utils/constants/imports.dart';

class MainVendorScreen extends StatefulWidget {
  const MainVendorScreen({super.key});

  @override
  State<MainVendorScreen> createState() => _MainVendorScreenState();
}

class _MainVendorScreenState extends State<MainVendorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Main Screen')));
  }
}
