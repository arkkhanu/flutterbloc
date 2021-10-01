class Posts {
  int? userId;
  int? id;
  String? title;
  String? body;

  Posts({this.userId, this.id, this.title, this.body});

  Posts.fromJson(dynamic json) {
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    body = json["body"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["userId"] = userId;
    map["id"] = id;
    map["title"] = title;
    map["body"] = body;
    return map;
  }

  static List<Posts> parseList(dynamic data) {
    List<Posts> _li = [];
    data.forEach((each) {
      _li.add(Posts.fromJson(each));
    });
    return _li;
  }
}
