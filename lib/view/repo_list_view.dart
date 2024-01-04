import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_hub_repo_app/app_route.dart';
import 'package:git_hub_repo_app/models/repo_model.dart';
import 'package:git_hub_repo_app/view_model/github_repo_controller.dart';

class RepoListView extends StatelessWidget {
  RepoListView({super.key});

  final _controller = Get.put(GithubRepoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Repositories List'),
      ),
      body: Obx(
        () => _controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _controller.repoList.length,
                itemBuilder: (context, index) {
                  final repo = _controller.repoList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 1,
                      child: ListTile(
                        title: Text("Repo Name : ${repo.name}",
                            overflow: TextOverflow.ellipsis),
                        subtitle: Text(
                          "Owner Name : ${repo.owner.login}",
                          maxLines: 2,
                        ),
                        onTap: () {
                          _showConfirmationDialog(repo);
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  void _showConfirmationDialog(RepoModel repo) {
    Get.bottomSheet(
      Container(
          height: 150,
          color: Colors.greenAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: const Text('Confirm'),
                onPressed: () {
                  Get.back();
                  Get.toNamed(RouteNames.repoCommitDetails,
                      arguments: [repo.owner.login, repo.name]);
                },
              ),
              ElevatedButton(
                child: const Text('Cancel'),
                onPressed: () => Get.back(),
              ),
            ],
          )),
      isDismissible: true,
    );
  }
// void _showConfirmationDialog(RepoModel repo) {
//   Get.bottomSheet(
//     Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         ElevatedButton(
//           child: const Text('Confirm'),
//           onPressed: () {
//             Get.back();
//             Get.toNamed(RouteNames.repoCommitDetails,
//                 arguments: [repo.owner.login, repo.name]);
//           },
//         ),
//         ElevatedButton(
//           child: const Text('Cancel'),
//           onPressed: () => Get.back(),
//         ),
//       ],
//     ),
//   );
// }
}
