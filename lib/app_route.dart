import 'package:get/get.dart';
import 'package:git_hub_repo_app/view/repo_commit_detail_view.dart';
import 'package:git_hub_repo_app/view/repo_list_view.dart';

class RouteNames{
  static String repoList ="/repoListScreen";
  static String repoCommitDetails ="/repoCommitDetailsScreen";
}

class AppRoute {
  static final route =[
    GetPage(name: RouteNames.repoList, page: ()=>RepoListView()),
    GetPage(name: RouteNames.repoCommitDetails, page: ()=> RepoCommitDetailView()),
  ];
}