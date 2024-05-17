class ApiEndPoints {
  static String searchProducts({String? sortBy, String? order}) => "search/repositories?q=Flutter&sort=$sortBy&order=$order";
}
