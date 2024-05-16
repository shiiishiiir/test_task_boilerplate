class ApiEndPoints {
  //Authentication
  static const String signIn = "customer/auth/login";
  static String editProductReview(int? reviewId) => "review/edit/$reviewId";
}