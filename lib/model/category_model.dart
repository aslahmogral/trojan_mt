import 'dart:convert';

List<Categories> categoriesModelFromJson(String str) =>
    List<Categories>.from(json.decode(str).map((x) => Categories.fromJson(x)));

class Categories {
  String? id;
  String? name;
  int? number_of_courses;
  String? thumbnail;
  
 

  Categories(
      {required this.id,
      required this.name,
      required this.number_of_courses,
      required this.thumbnail});

  Categories.create({
    this.id,
    this.name,
    this.number_of_courses,
    this.thumbnail,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
        id: json['id'],
        name: json['name'],
        number_of_courses: json['number_of_courses'],
        thumbnail: json['thumbnail']);
  }

  // factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  // Map<String, dynamic> toJson() => _$MenuToJson(this);
}