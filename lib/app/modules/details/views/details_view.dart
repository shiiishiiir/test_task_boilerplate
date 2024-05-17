import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_test/app/core/widgets/Card_Details.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${controller.item.value.name}".toUpperCase()),
      ),
      body: CardDetails(item: controller.item.value),
    );
  }
}
