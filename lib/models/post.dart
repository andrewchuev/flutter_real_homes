class Post {
  int id;
  String title;
  String content;
  String attachement;
  String price;

  Post({required this.id, required this.title, required this.content, required this.attachement, required this.price});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      attachement: json['attachement'],
      price: json['price'],
    );
  }
}