import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_vendor_app/provider/user_provider.dart';
import 'package:multi_vendor_app/utils/constants/imports.dart';
import 'package:multi_vendor_app/view/screens/main_screen/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  //wrapping with providerscope - for managing te state
  runApp(ProviderScope(child: const MyApp()));
}

//changing statelesswidget to- consumerWidget
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  //checking for token and is user data avail

  Future<void> _checkTokenAndSetUser(WidgetRef ref) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //retrive user data & token from shared preferences
    String? token = prefs.getString('auth_token');
    String? userJson = prefs.getString('user');

    //if both token & user data are available, update the user state
    if (token != null && userJson != null) {
      ref.read(userProvider.notifier).setUser(userJson);
    } else {
      ref.read(userProvider.notifier).signOut();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Multi Vendor App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: _checkTokenAndSetUser(ref),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final user = ref.watch(userProvider);

          return user != null ? MainScreen() : LoginScreen();
        },
      ),
    );
  }
}
