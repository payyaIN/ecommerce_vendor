import 'package:multi_vendor_app/provider/banner_provider.dart';
import 'package:multi_vendor_app/utils/constants/imports.dart';

class BannerWidget extends ConsumerStatefulWidget {
  const BannerWidget({super.key});

  @override
  ConsumerState<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends ConsumerState<BannerWidget> {
  // late Future<List<BannerModel>> futureBanners;

  @override
  void initState() {
    super.initState();
    // futureBanners = BannerController().loadBanners();
    _fetchBanners();
  }

  Future<void> _fetchBanners() async {
    final BannerController bannerController = BannerController();
    try {
      final banners = await bannerController.loadBanners();
      ref.read(bannerProvider.notifier).setBanners(banners);
    } catch (e) {
      print("$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final banners = ref.watch(bannerProvider);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 170,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(4),
      ),
      child: PageView.builder(
        itemCount: banners.length,
        itemBuilder: (context, index) {
          final banner = banners[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(banner.image, fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: 170,
//       decoration: BoxDecoration(
//         color: const Color(0xFFF7F7F7),
//         borderRadius: BorderRadius.circular(4),
//       ),
//       child: FutureBuilder(
//         future: futureBanners,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('error:${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No Banner'));
//           } else {
//             final banners = snapshot.data!;

//             return SizedBox(
//               height: 400,
//               child: PageView.builder(
//                 itemCount: banners.length,
//                 itemBuilder: (context, index) {
//                   final banner = banners[index];
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Image.network(banner.image, fit: BoxFit.cover),
//                   );
//                 },
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
