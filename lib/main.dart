import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_hub_repo_app/app_route.dart';
import 'package:git_hub_repo_app/dependency_injection/app_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const GitHubRepoApp());
}

class GitHubRepoApp extends StatelessWidget {
  const GitHubRepoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GitHub Repo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppRoute.route,
      initialRoute: RouteNames.repoList,
      initialBinding: InitBindings(),
    );
  }
}
