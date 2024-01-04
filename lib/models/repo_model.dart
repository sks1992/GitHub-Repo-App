class RepoDetailModel {
  late final bool isSuccess;
  late final String message;
  late final List<RepoModel>? repoModel;

  RepoDetailModel({
    required this.isSuccess,
    required this.message,
    this.repoModel,
  });
}

class RepoModel {
  RepoModel({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.fullName,
    required this.private,
    required this.owner,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.pushedAt,
  });

  late final int id;
  late final String nodeId;
  late final String name;
  late final String fullName;
  late final bool private;
  late final Owner owner;
  late final String description;
  late final String createdAt;
  late final String updatedAt;
  late final String pushedAt;

  RepoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nodeId = json['node_id'];
    name = json['name'];
    fullName = json['full_name'];
    private = json['private'];
    owner = Owner.fromJson(json['owner']);
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pushedAt = json['pushed_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['node_id'] = nodeId;
    _data['name'] = name;
    _data['full_name'] = fullName;
    _data['private'] = private;
    _data['owner'] = owner.toJson();
    _data['description'] = description;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['pushed_at'] = pushedAt;
    return _data;
  }
}

class Owner {
  Owner({
    required this.login,
    required this.avatarUrl,
  });

  late final String login;
  late final String avatarUrl;

  Owner.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['login'] = login;
    _data['avatar_url'] = avatarUrl;
    return _data;
  }
}
