import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/response/home/git_repo_response.dart';
import '../config/app_colors.dart';

class RepoCard extends StatelessWidget {
  final Item item;

  const RepoCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.secondary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
              width: Get.height * 0.12,
              height: Get.height * 0.12,
              margin: const EdgeInsets.only(right: 12),
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (item.name != null && item.name != "")
                      Expanded(
                        child: Text(
                          item.name?.trim() ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    const SizedBox(
                      width: 6,
                    ),
                    if (item.stargazersCount != null && item.stargazersCount! > 0)
                      Text(
                        "${item.stargazersCount!} Stars",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                if (item.description != null && item.description != "")
                  Text(
                    item.description ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                const SizedBox(height: 8),
                if (item.htmlUrl != null && item.htmlUrl != "")
                  Text(
                    item.htmlUrl ?? "",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
