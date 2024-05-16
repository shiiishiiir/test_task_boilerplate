import '../../services/network_client/api_client.dart';
import '../../services/network_client/api_end_points.dart';

class ProductDetailsRepository {
  /*Future<ProductDetailsResponse> getProductDetails(int id) async {
    var response = await ApiClient().get(
        ApiEndPoints.getProductStockById(id), getProductDetails,
        isHeaderRequired: false, isLoaderRequired: false);
    return productDetailsResponseFromJson(response.toString());
  }*/
  /*Future<AddToCartResponse> addToCart(
      AddToCartPostBody addToCartPlayLoad) async {
    var response = await ApiClient(customBaseUrl: AppConfig.authBaseUrl).post(
      ApiEndPoints.addToCart,
      addToCartPlayLoad,
      addToCart,
      isHeaderRequired: true,
      isLoaderRequired: false,
    );
    return addToCartResponseFromJson(response.toString());
  }*/


  /*Future<GetVouchersResponse> getVouchers(
      GetVoucherPostBody voucherPlayLoad) async {
    var response = await ApiClient().post(
      ApiEndPoints.getVouchers,
      voucherPlayLoad,
      getVouchers,
      isHeaderRequired: true,
      isLoaderRequired: false,
    );
    return getVouchersResponseFromJson(response.toString());
  }*/
}
