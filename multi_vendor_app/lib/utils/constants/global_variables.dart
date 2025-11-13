String baseUrl = "http://192.168.1.8:3000";
String signUpUrl = "$baseUrl/api/signup";
String signInUrl = "$baseUrl/api/signin";
String categoryUrl = '$baseUrl/api/categories';
String bannerUrl = '$baseUrl/api/banner';
String subCategoryUrl = '$baseUrl/api/subcategories';
String productUrl = '$baseUrl/api/popular-products';
String getProductByCategoryUrl(String category) =>
    '$baseUrl/api/products-by-category/$category';
String uploadOrdersUrl = '$baseUrl/api/orders';
String updateUserLocUrl(String id) => '$baseUrl/api/users/$id';
String loadOrderById(String buyerId) => '$baseUrl/api/orders/$buyerId';
String deleteOrderById(String id) => '$baseUrl/api/orders/$id';
