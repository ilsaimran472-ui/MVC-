class ApiConstants {
  ApiConstants._();

  static const String baseUrl = "https://dummyjson.com"; //server

  static const int connectTimeoutSeconds = 20;

  // Auth endpoints
  //users models.
  static const String login = "/user/add";
  static const String editUser = "users/{{userId}}";
  static const String deleteUser = "users/{{userId}}";
  static const String cart = "users/{{userId}}/carts"; 

  //products
  static const String allproduct = "products"; 
  static const String newproduct = "products/add"; 
  static const String update = "products/1"; 
   static const String delete = "products/1"; 
}
