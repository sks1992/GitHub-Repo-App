import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_hub_repo_app/models/repo_commit_model.dart';
import 'package:git_hub_repo_app/services/github_service.dart';

class RepoCommitController extends GetxController {
  final _gitHubApi = Get.find<GitHubApiService>();
  String repoName = Get.arguments[1];
  String repoOwnerName = Get.arguments[0];

  var repoCommitList = <RepoCommitModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getUserRepoCommitList(repoOwnerName, repoName);
  }

  Future<void> getUserRepoCommitList(String ownerName, String repoName) async {
    isLoading.value = true;
    final result = await _gitHubApi.getRipoCommitDetail(ownerName, repoName);
    isLoading.value = false;
    if (result.isSuccess) {
      repoCommitList.value = result.repoCommitModel!;
    } else {
      Get.snackbar("Error", result.message,
          colorText: Colors.red, snackPosition: SnackPosition.BOTTOM);
    }
  }
}
