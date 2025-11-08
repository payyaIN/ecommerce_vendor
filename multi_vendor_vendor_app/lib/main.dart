import 'package:multi_vendor_vendor_app/utils/constants/imports.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  Future<void> _checkTokenAndSetVendor(WidgetRef ref) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //retrive vendor data & token from shared preferences
    String? token = prefs.getString('auth_token');
    String? vendorJson = prefs.getString('vendor');
    print('Token: ${token != null ? "exists" : "null"}');
    print('VendorJson: $vendorJson');
    //if both token & vendor data are available, update the vendor state
    if (token != null && vendorJson != null) {
      ref.read(vendorProvider.notifier).setVendor(vendorJson);
      print('DEBUG - Vendor set: ${ref.read(vendorProvider)?.fullName}');
    } else {
      ref.read(vendorProvider.notifier).signOut();
      print('Vendor signed out');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Vendor App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: FutureBuilder(
        future: _checkTokenAndSetVendor(ref),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final vendor = ref.watch(vendorProvider);

          return vendor != null ? MainVendorScreen() : LoginScreen();
        },
      ),
    );
  }
}
