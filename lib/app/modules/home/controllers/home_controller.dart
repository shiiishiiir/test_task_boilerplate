import 'package:get/get.dart';

import '../../../data/models/response/home/git_repo_response.dart';
import '../../../data/repository/home_repository.dart';

class HomeController extends GetxController {
  final items = <Item>[].obs;

  @override
  void onInit() {
    fetchRepos();
    super.onInit();
  }

  fetchRepos() async {
    var response = await HomeRepository().getGitRepos();
    items.addAll(response.items ?? []);
  }
}
