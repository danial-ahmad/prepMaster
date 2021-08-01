class Categories {
  final int id;
  final String coursetitle;
  final String description;

  Categories._({this.coursetitle, this.description, this.id});

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories._(
      id: json['courseid'],
      coursetitle: json['course_name'],
      description: json['course_description'],
    );
  }
}
