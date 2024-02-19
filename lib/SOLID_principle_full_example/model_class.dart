class UniversityModel {
  final String name;
  final String country;
  final List webPage;

  UniversityModel({required this.name, required this.country, required this.webPage});

  factory UniversityModel.fromJson(Map<String, dynamic> json) => UniversityModel(
    name: json['name'] as String,
    country: json['country'] as String,
    webPage: json['web_pages'],
  );
}