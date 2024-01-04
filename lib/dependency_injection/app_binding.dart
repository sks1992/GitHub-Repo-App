import 'package:get/get.dart';
import 'package:git_hub_repo_app/services/github_service.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GitHubApiService>(
      () => GitHubApiService(),
    );
  }
}
