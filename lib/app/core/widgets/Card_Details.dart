import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_test/app/core/config/app_colors.dart';

import '../../data/models/response/home/git_repo_response.dart';

class CardDetails extends StatelessWidget {
  final Item item;

  const CardDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.secondary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (item.owner != null && item.owner?.avatarUrl != null && item.owner?.avatarUrl != "")
            Align(
              alignment: Alignment.center,
              child: Container(
                  width: Get.height * 0.25,
                  height: Get.height * 0.25,
                  margin: const EdgeInsets.only(bottom: 12),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: AppColors.secondary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: item.owner?.avatarUrl ?? "",
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  )),
            ),
          if (item.name != null && item.name != "")
            RichText(
              text: TextSpan(
                text: "Name: ",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
                children: [
                  TextSpan(
                    text: item.name?.trim().capitalizeFirst ?? "",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 8),
          if (item.stargazersCount != null && item.stargazersCount! > 0)
            RichText(
              text: TextSpan(
                text: "Stars: ",
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.black,
                ),
                children: [
                  TextSpan(
                    text: "${item.stargazersCount!}",
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 8),
          if (item.htmlUrl != null && item.htmlUrl != "")
            RichText(
              text: TextSpan(
                text: "URL: ",
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.black,
                ),
                children: [
                  TextSpan(
                    text: item.htmlUrl ?? "",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 8),
          if (item.description != null && item.description != "")
            RichText(
              text: TextSpan(
                text: "Description: ",
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.black,
                ),
                children: [
                  TextSpan(
                    text: item.description?.trim().capitalizeFirst ?? "",
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 8),
          if (item.updatedAt != null)
            RichText(
              text: TextSpan(
                text: "Last Updated:  ",
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.black,
                ),
                children: [
                  TextSpan(
                    text: "${DateFormat('MMMM dd, yyyy').format(item.updatedAt ?? DateTime.now())}  ${DateFormat('hh:mm a').format(item.updatedAt ?? DateTime.now())}.",
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
