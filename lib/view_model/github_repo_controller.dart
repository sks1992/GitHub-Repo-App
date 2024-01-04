import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_hub_repo_app/models/repo_model.dart';
import 'package:git_hub_repo_app/services/github_service.dart';

class GithubRepoController extends GetxController {
  final _gitHubApi = Get.find<GitHubApiService>();
  var repoList = <RepoModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getUserRepoList("JakeWharton");
  }

  Future<void> getUserRepoList(String username) async {
    isLoading.value = true;
    final result = await _gitHubApi.getRipoDetailList(username);
    isLoading.value = false;
    if (result.isSuccess) {
      repoList.value = result.repoModel!;
    } else {
      Get.snackbar("Error", result.message, colorText: Colors.red,snackPosition: SnackPosition.BOTTOM);
    }
  }
}
