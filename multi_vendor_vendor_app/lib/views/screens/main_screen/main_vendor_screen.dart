import 'package:flutter/cupertino.dart';
import 'package:multi_vendor_vendor_app/utils/constants/imports.dart';

class MainVendorScreen extends StatefulWidget {
  const MainVendorScreen({super.key});

  @override
  State<MainVendorScreen> createState() => _MainVendorScreenState();
}

class _MainVendorScreenState extends State<MainVendorScreen> {
  int _pageIndex = 0;

  final List<Widget> _pages = [
    const EarningsScreen(),
    const UploadScreen(),
    const EditScreen(),
    const OrderScreen(),
    const VendorProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: _pageIndex,
        onTap: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.money_dollar),
            label: "Earnings",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.upload_circle),
            label: "Upload",
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Edit"),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            label: "Orders",
          ),

          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: _pages[_pageIndex],
    );
  }
}
