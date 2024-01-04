import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:git_hub_repo_app/models/repo_commit_model.dart';
import 'package:git_hub_repo_app/models/repo_model.dart';

class GitHubApiService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = "https://api.github.com";
    httpClient.timeout = const Duration(minutes: 1);
    httpClient.addRequestModifier<void>((request) async {
      if (kDebugMode) {
        print(request.url);
        print("Request Body:: ${await request.bodyBytes.bytesToString()}");
      }
      return request;
    });

    httpClient.addResponseModifier((request, response) async {
      if (kDebugMode) {
        log("Response Body::: ${response.bodyString ?? ""}");
      }
      return response;
    });
    super.onInit();
  }

  //https://api.github.com/users/JakeWharton/repos
  Future<RepoDetailModel> getRipoDetailList(String username) async {
    var response = await get("/users/$username/repos");
    if (response.hasError) {
      return RepoDetailModel(
          isSuccess: false, message: "Something went wrong. Try again.");
    } else {
      List<dynamic> parsedList = jsonDecode(response.bodyString!);
      var _list = parsedList.map((e) => RepoModel.fromJson(e)).toList();
      return RepoDetailModel(isSuccess: true, message: "", repoModel: _list);
    }
  }

  //https://api.github.com/repos/philipplackner/AndroidCrypto/commits
  Future<RepoCommitDetailModel> getRipoCommitDetail(
      String ownerName, String repoName) async {
    var response = await get("/repos/$ownerName/$repoName/commits");
    if (response.hasError) {
      return RepoCommitDetailModel(
          isSuccess: false, message: "Something went wrong. Try again.");
    } else {
      List<dynamic> parsedList = jsonDecode(response.bodyString!);
      var _list = parsedList.map((e) => RepoCommitModel.fromJson(e)).toList();
      return RepoCommitDetailModel(
          isSuccess: true, message: "", repoCommitModel: _list);
    }
  }
}
