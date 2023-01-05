import 'dart:convert';

List<Course> courseModelFromJson(String str) =>
    List<Course>.from(json.decode(str).map((x) => Course.fromJson(x)));

class Course {
  String? id;
  String? title;
  String? price;
  String? thumbnail;

  Course(
      {required this.id,
      required this.price,
      required this.title,
      required this.thumbnail});

  Course.create({
    this.id,
    this.title,
    this.price,
    this.thumbnail,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        thumbnail: json['thumbnail']);
  }

  // factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  // Map<String, dynamic> toJson() => _$MenuToJson(this);
}
