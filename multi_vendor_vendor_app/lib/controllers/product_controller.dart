import 'package:multi_vendor_vendor_app/utils/constants/imports.dart';
import 'package:http/http.dart' as http;

class ProductController {
  void uploadProduct({
    required BuildContext context,
    required String productName,
    required int productPrice,
    required int quantity,
    required String description,
    required List<File>? pickedImages,
    required String category,
    required String subCategory,
    required String vendorId,
    required String fullName,
  }) async {
    if (pickedImages != null) {
      final cloudinary = CloudinaryPublic("dnp20kt4r", "ad2puysd");
      List<String> images = [];
      //loop through each image in pickedImages List
      for (var i = 0; i < pickedImages.length; i++) {
        CloudinaryResponse cloudinaryResponse = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(pickedImages[i].path, folder: productName),
        );
        //add the secureUrl to images List
        images.add(cloudinaryResponse.secureUrl);
      }
      if (category.isNotEmpty && subCategory.isNotEmpty) {
        final ProductModel productModel = ProductModel(
          id: '',
          productName: productName,
          productPrice: productPrice,
          quantity: quantity,
          description: description,
          category: category,
          subCategory: subCategory,
          vendorId: vendorId,
          fullName: fullName,
          images: images,
        );

        var uri = addProductUrl;
        var url = Uri.parse(uri);

        Map<String, String> header = {
          'Content-Type': 'application/json; charset=utf-8',
        };

        http.Response response = await http.post(
          url,
          body: productModel.toJson(),
          headers: header,
        );
        manageHttpResponse(
          context: context,
          response: response,
          onSuccess: () {
            showSnackBar(content: 'Product Added Successfully');
          },
        );
        print('product response : ${response.body}');
      } else {
        showSnackBar(content: 'Select Category');
      }
    } else {
      showSnackBar(content: 'Select Image');
    }
  }
}
