import 'package:flutter/cupertino.dart';

import 'package:multi_vendor_webapp/views/utils/import_data.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _selectedScreen = VendorScreen();

  screenSelector(item) {
    switch (item.route) {
      case BuyerScreen.id:
        setState(() {
          _selectedScreen = BuyerScreen();
        });
        break;

      case CategoryScreen.id:
        setState(() {
          _selectedScreen = CategoryScreen();
        });
        break;

      case OrderScreen.id:
        setState(() {
          _selectedScreen = OrderScreen();
        });
        break;

      case ProductScreen.id:
        setState(() {
          _selectedScreen = ProductScreen();
        });
        break;

      case SubCategoryScreen.id:
        setState(() {
          _selectedScreen = const SubCategoryScreen();
        });
        break;

      case UploadBannerScreen.id:
        setState(() {
          _selectedScreen = UploadBannerScreen();
        });
        break;

      case VendorScreen.id:
        setState(() {
          _selectedScreen = VendorScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Management'),
      ),
      body: _selectedScreen,
      sideBar: SideBar(
        header: _headerWidget(),
        items: [
          AdminMenuItem(
              title: 'Vendor',
              icon: CupertinoIcons.person_3,
              route: VendorScreen.id),
          AdminMenuItem(
              title: 'Buyers',
              icon: CupertinoIcons.person,
              route: BuyerScreen.id),
          AdminMenuItem(
              title: 'Orders',
              icon: Icons.offline_bolt_rounded,
              route: OrderScreen.id),
          AdminMenuItem(
              title: 'Categories',
              icon: Icons.category,
              route: CategoryScreen.id),
          AdminMenuItem(
              title: 'Sub Categories',
              route: SubCategoryScreen.id,
              icon: CupertinoIcons.list_bullet_below_rectangle),
          AdminMenuItem(
              title: 'Upload Banners',
              icon: Icons.upload,
              route: UploadBannerScreen.id),
          AdminMenuItem(
              title: 'Products', icon: Icons.inventory, route: ProductScreen.id)
        ],
        selectedRoute: VendorScreen.id, //selected Screen
        onSelected: (item) {
          screenSelector(item);
        },
      ),
    );
  }

  _headerWidget() {
    return Container(
      decoration: BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Multi Vendor Admin Panel',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w800, color: Colors.white),
        ),
      ),
    );
  }
}
