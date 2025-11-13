import 'package:multi_vendor_app/provider/cart_provider.dart';
import 'package:multi_vendor_app/utils/constants/imports.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final ProductModel productModel;

  const ProductDetailScreen({super.key, required this.productModel});
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProviderData = ref.read(cartProvider.notifier);
    final cartData = ref.watch(cartProvider);
    final isInCart = cartData.containsKey(widget.productModel.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Detail',
          style: GoogleFonts.quicksand(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 260,
                height: 275,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: 0,
                      top: 50,
                      child: Container(
                        width: 260,
                        height: 260,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: const Color(0XFFD8DDFF),
                          borderRadius: BorderRadius.circular(130),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 22,
                      top: 0,
                      child: Container(
                        width: 216,
                        height: 274,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: const Color(0xFF9CA8FF),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: SizedBox(
                          height: 300,
                          child: PageView.builder(
                            itemCount: widget.productModel.images.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Image.network(
                                widget.productModel.images[index],
                                width: 198,
                                height: 225,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.productModel.productName,
                    style: GoogleFonts.roboto(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      color: const Color(0xFF3C55Ef),
                    ),
                  ),
                  Text(
                    "\$${widget.productModel.productPrice}",
                    style: GoogleFonts.roboto(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF3C55Ef),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.productModel.category,
                style: GoogleFonts.roboto(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About",
                    style: GoogleFonts.lato(
                      fontSize: 17,
                      letterSpacing: 1.7,
                      color: const Color(0xFF363330),
                    ),
                  ),
                  Text(
                    widget.productModel.description,
                    style: GoogleFonts.lato(letterSpacing: 1.7, fontSize: 15),
                  ),
                ],
              ),
            ),
            const ReusableTextWidget(title: 'Related Products', subtitle: ''),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8),
        child: InkWell(
          onTap: isInCart
              ? null
              : () {
                  cartProviderData.addProductToCart(
                    productName: widget.productModel.productName,
                    productPrice: widget.productModel.productPrice,
                    category: widget.productModel.category,
                    image: widget.productModel.images,
                    vendorId: widget.productModel.vendorId,
                    productQuantity: widget.productModel.quantity,
                    quantity: 1,
                    productId: widget.productModel.id,
                    description: widget.productModel.description,
                    fullName: widget.productModel.fullName,
                  );
                  showSnackBar(content: widget.productModel.productName);
                },
          child: Container(
            width: 386,
            height: 46,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: isInCart ? Colors.grey : const Color(0xFF3B54EE),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                "ADD TO CART ",
                style: GoogleFonts.mochiyPopOne(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
