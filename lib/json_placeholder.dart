class JsonPosts {
  final List<JsonPlaceholder> placeHolders;

  const JsonPosts({required this.placeHolders});

  factory JsonPosts.fromJson(List<dynamic> photos) {
    List<JsonPlaceholder> n = <JsonPlaceholder>[];
    return JsonPosts(
        placeHolders: photos.map((e) => JsonPlaceholder.fromJson(e)).toList());
  }
}

class JsonPlaceholder {
  int? userId;
  int? id;
  String? title;
  String? body;

  JsonPlaceholder({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  JsonPlaceholder copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return JsonPlaceholder(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory JsonPlaceholder.fromJson(Map<String, dynamic> json) {
    return JsonPlaceholder(
      userId: json['userId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      body: json['body'] as String?,
    );
  }

  @override
  String toString() =>
      "JsonPlaceholder(userId: $userId,id: $id,title: $title,body: $body)";

  @override
  int get hashCode => Object.hash(userId, id, title, body);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JsonPlaceholder &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          id == other.id &&
          title == other.title &&
          body == other.body;
}
