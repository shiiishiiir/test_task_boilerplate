import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_test/app/routes/app_pages.dart';

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
        return ListView.builder(
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.items[index].name ?? ""),
              subtitle: Text(controller.items[index].description ?? ""),
              onTap: () {
                Get.toNamed(Routes.details, arguments: controller.items[index]);
              },
            );
          },
        );
      }),
    );
  }
}
