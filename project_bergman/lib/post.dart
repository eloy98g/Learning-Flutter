class Post {
  final int year;
  final String title;
  final String director;
  final String description;

  Post({
    this.year,
    this.title,
    this.director,
    this.description,
  });

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      year: json['year'],
      title: json['title'],
      //director: json['direction'],
      description: json['description'],
    );
  }
}