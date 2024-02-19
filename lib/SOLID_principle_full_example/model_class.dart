class Post {
  final String name;
  final String country;
  final List webPage;

  Post({required this.name, required this.country, required this.webPage});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    name: json['name'] as String,
    country: json['country'] as String,
    webPage: json['web_pages'],
  );
}