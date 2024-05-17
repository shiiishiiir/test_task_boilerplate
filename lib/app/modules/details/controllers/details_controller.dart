import 'package:get/get.dart';

import '../../../data/models/response/home/git_repo_response.dart';

class DetailsController extends GetxController {
  final item = Item().obs;

  @override
  void onInit() {
    item.value = Get.arguments;
    super.onInit();
  }
}
