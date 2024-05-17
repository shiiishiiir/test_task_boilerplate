class ApiEndPoints {
  static String searchProducts({String? sortBy, String? order, int? currentPage, int? perPage}) => "search/repositories?q=Flutter&sort=$sortBy&order=$order&page=$currentPage&per_page=$perPage";
}
