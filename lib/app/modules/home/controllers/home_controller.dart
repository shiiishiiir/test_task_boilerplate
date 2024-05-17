import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_test/app/core/helper/print_log.dart';
import 'package:task_test/app/core/widgets/app_widgets.dart';

import '../../../core/helper/app_helper.dart';
import '../../../data/models/response/home/git_repo_response.dart';
import '../../../data/repository/home_repository.dart';
import '../../../services/connection_manager/connection_manager_controller.dart';

class HomeController extends GetxController {
  final paginateController = ScrollController().obs;
  final items = <Item>[].obs;
  final totalItems = 0.obs;
  final currentPage = 1.obs;
  final perPage = 10.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    ConnectionManagerController().isInternetConnected.listen((value) {
      if (value == true) {
        AppWidgets().getSnackBar(
          title: "Success",
          message: "Internet Connected",
        );
        fetchRepos();
      } else {
        AppWidgets().getSnackBar(
          title: "Error",
          message: "No Internet Connection",
        );
      }
    });

    paginateController.value.addListener(() async {
      // scroll controller activates when 70% of the scroll is reached
      try {
        if (paginateController.value.offset >= (paginateController.value.position.maxScrollExtent * 0.7) && isLoading.value == false) {
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
              if (currentPage.value == 1)
                {
                  items.clear(),
                },
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
      if (currentPage.value == 1) {
        items.clear();
      }
      items.addAll(response.items ?? []);
      totalItems.value = response.totalCount ?? 0;
    } else {
      AppWidgets().getSnackBar(
        title: "Error",
        message: response.message ?? "Something went wrong",
      );
    }
  }
}
