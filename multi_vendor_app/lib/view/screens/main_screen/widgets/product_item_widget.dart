import 'package:multi_vendor_app/utils/constants/imports.dart';

class ProductItemWidget extends ConsumerStatefulWidget {
  final ProductModel productModel;

  const ProductItemWidget({super.key, required this.productModel});

  @override
  ConsumerState<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends ConsumerState<ProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    final cartProviderData = ref.read(cartProvider.notifier);
    final cartData = ref.watch(cartProvider);
    final isInCart = cartData.containsKey(widget.productModel.id);
    // final favoriteProviderData = ref.read(favoriteProvider.notifier);
    // ref.watch(favoriteProvider);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ProductDetailScreen(productModel: widget.productModel);
            },
          ),
        );
      },
      child: Container(
        width: 170,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 170,
              decoration: BoxDecoration(
                color: const Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Stack(
                children: [
                  Image.network(
                    widget.productModel.images[0],
                    height: 170,
                    width: 170,
                    fit: BoxFit.cover,
                  ),
                  // Positioned(
                  //   top: 5,
                  //   right: 0,
                  //   child: InkWell(
                  //     onTap: () {
                  //       favoriteProviderData.addProductToFavorite(
                  //         productName: widget.productModel.productName,
                  //         productPrice: widget.productModel.productPrice,
                  //         category: widget.productModel.category,
                  //         image: widget.productModel.images,
                  //         vendorId: widget.productModel.vendorId,
                  //         productQuantity: widget.productModel.quantity,
                  //         quantity: 1,
                  //         productId: widget.productModel.id,
                  //         description: widget.productModel.description,
                  //         fullName: widget.productModel.fullName,
                  //       );

                  //       showSnackBar(
                  //         content: 'added ${widget.productModel.productName}',
                  //       );
                  //     },
                  //     child:
                  //         favoriteProviderData.getFavoriteItems.containsKey(
                  //           widget.productModel.id,
                  //         )
                  //         ? Icon(Icons.favorite, color: Colors.red)
                  //         : const Icon(Icons.favorite_border),
                  //   ),
                  // ),
                  Positioned(
                    bottom: 0,
                    right: 0,
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

                              showSnackBar(
                                content: widget.productModel.productName,
                              );
                            },
                      child: Image.asset(
                        'assets/icons/cart.png',
                        height: 26,
                        width: 26,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.productModel.productName,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.montserrat(
                fontSize: 14,
                color: const Color(0xFF212121),
                fontWeight: FontWeight.bold,
              ),
            ),
            // widget.productModel.averageRating == 0
            //     ? const SizedBox()
            //     : Row(
            //         children: [
            //           const Icon(Icons.star, color: Colors.amber, size: 12),
            //           const SizedBox(width: 4),
            //           Text(
            //             widget.productModel.averageRating.toStringAsFixed(1),
            //             style: GoogleFonts.montserrat(
            //               fontWeight: FontWeight.bold,
            //               fontSize: 12,
            //             ),
            //           ),
            //         ],
            //       ),
            Text(
              widget.productModel.category,
              style: GoogleFonts.montserrat(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: const Color(0xff868D94),
              ),
            ),
            Text(
              '\$${widget.productModel.productPrice.toStringAsFixed(2)}',
              style: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
