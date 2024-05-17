import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/repo_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(() {
        return Scrollbar(
          child: ListView.builder(
            controller: controller.paginateController.value,
            itemCount: controller.items.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            itemBuilder: (context, index) {
              return InkWell(
                child: RepoCard(
                  item: controller.items[index],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
