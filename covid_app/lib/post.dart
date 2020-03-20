class Post{
  final int userID;
  final int id;
  final String title;
  final String body;

  Post({
    this.userID,
    this.id,
    this.title,
    this.body,
  });

  factory Post.fromJSON(Map<String, dynamic> json){
    return Post(
      userID: json["userID"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }
}