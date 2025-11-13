String baseUrl = "http://192.168.1.8:3000";
String vendorSignUpUrl = "$baseUrl/api/vendor/signup";
String vendorSignInUrl = "$baseUrl/api/vendor/signin";
String categoryUrl = "$baseUrl/api/categories";
String addProductUrl = "$baseUrl/api/add-product";

String bannerUrl = '$baseUrl/api/banner';
String subCategoryUrl = '$baseUrl/api/subcategories';
String productUrl = '$baseUrl/api/popular-products';
String getProductByCategoryUrl(String category) =>
    '$baseUrl/api/products-by-category/$category';
String uploadOrdersUrl = '$baseUrl/api/orders';
String updateUserLocUrl(String id) => '$baseUrl/api/users/$id';
String loadOrderById(String buyerId) => '$baseUrl/api/orders/$buyerId';
String loadOrderByVendorId(String vendorId) =>
    '$baseUrl/api/orders/vendors/$vendorId';
String deleteOrderById(String id) => '$baseUrl/api/orders/$id';
