import '../../services/network_client/api_client.dart';
import '../../services/network_client/api_end_points.dart';
import '../models/response/home/git_repo_response.dart';

class HomeRepository {
  Future<GitRepoResponse> getGitRepos({String sortBy = "star", String order = 'desc'}) async {
    var response = await ApiClient().get(
      ApiEndPoints.searchProducts(sortBy: sortBy, order: order),
      getGitRepos,
      isHeaderRequired: false,
      isLoaderRequired: false,
    );
    return gitRepoResponseFromJson(response.toString());
  }

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
