import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_test/app/core/helper/print_log.dart';
import 'package:task_test/app/core/widgets/app_widgets.dart';

import '../../../core/helper/app_helper.dart';
import '../../../data/models/response/home/git_repo_response.dart';
import '../../../data/repository/home_repository.dart';

class HomeController extends GetxController {
  final paginateController = ScrollController();
  final items = <Item>[].obs;
  final totalItems = 0.obs;
  final currentPage = 1.obs;
  final perPage = 10.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    paginateController.addListener(() async {
      // scroll controller activates when 70% of the scroll is reached
      try {
        if (paginateController.offset >= (paginateController.position.maxScrollExtent * 0.7) && isLoading.value == false) {
          currentPage.value++;
          await fetchRepos();
        }
      } catch (e) {
        printLog(e);
      }
    });
    fetchRepos();
    super.onInit();
  }

  fetchRepos() async {
    isLoading.value = true;
    AppHelper().getStringPref('items').then((value) => {
          if (value != null)
            {
              items.clear(),
              items.addAll(gitRepoResponseFromJson(value).items ?? []),
              items.refresh(),
            }
        });
    var response = await HomeRepository().getGitRepos(
      currentPage: currentPage.value,
      perPage: perPage.value,
    );
    isLoading.value = false;
    if (response.incompleteResults == false) {
      AppHelper().saveStringPref('items', jsonEncode(response));
      items.addAll(response.items ?? []);
      totalItems.value = response.totalCount ?? 0;
    } else {
      AppWidgets().getSnackBar(
        title: "Error",
        message: "Something went wrong",
      );
    }
  }
}
