import 'package:multi_vendor_app/utils/constants/imports.dart';
import 'package:multi_vendor_app/view/screens/main_screen/nav_screens/widgets/category_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          MediaQuery.of(context).size.height * 0.20,
        ),
        child: const HeaderWidget(),
      ),
      body: const SingleChildScrollView(
        child: Column(children: [BannerWidget(), CategoryItemWidget()]),
      ),
    );
  }
}
