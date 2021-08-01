class PastPaper {
  final int id;
  final String imgurl;
  final String description;

  PastPaper._({this.imgurl, this.description, this.id});

  factory PastPaper.fromJson(Map<String, dynamic> json) {
    return PastPaper._(
      id: json['id'],
      imgurl: json['paper_url'],
      description: json['p_description'],
    );
  }
}
