class RepoCommitDetailModel {
  late final bool isSuccess;
  late final String message;
  late final List<RepoCommitModel>? repoCommitModel;

  RepoCommitDetailModel({
    required this.isSuccess,
    required this.message,
    this.repoCommitModel,
  });
}

class RepoCommitModel {
  RepoCommitModel({
    required this.commit,
  });

  late final Commit commit;

  RepoCommitModel.fromJson(Map<String, dynamic> json) {
    commit = Commit.fromJson(json['commit']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['commit'] = commit.toJson();
    return _data;
  }
}

class Commit {
  Commit({
    required this.author,
    required this.committer,
    required this.message,
    required this.url,
    required this.commentCount,
    required this.verification,
  });

  late final Author author;
  late final Committer committer;
  late final String message;
  late final String url;
  late final int commentCount;
  late final Verification verification;

  Commit.fromJson(Map<String, dynamic> json) {
    author = Author.fromJson(json['author']);
    committer = Committer.fromJson(json['committer']);
    message = json['message'];
    url = json['url'];
    commentCount = json['comment_count'];
    verification = Verification.fromJson(json['verification']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['author'] = author.toJson();
    _data['committer'] = committer.toJson();
    _data['message'] = message;
    _data['url'] = url;
    _data['comment_count'] = commentCount;
    _data['verification'] = verification.toJson();
    return _data;
  }
}

class Author {
  Author({
    required this.name,
    required this.email,
    required this.date,
  });

  late final String name;
  late final String email;
  late final String date;

  Author.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['email'] = email;
    _data['date'] = date;
    return _data;
  }
}

class Committer {
  Committer({
    required this.name,
    required this.email,
    required this.date,
  });

  late final String name;
  late final String email;
  late final String date;

  Committer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['email'] = email;
    _data['date'] = date;
    return _data;
  }
}

class Verification {
  Verification({
    required this.verified,
    required this.reason,
  });

  late final bool verified;
  late final String reason;

  Verification.fromJson(Map<String, dynamic> json) {
    verified = json['verified'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['verified'] = verified;
    _data['reason'] = reason;
    return _data;
  }
}
