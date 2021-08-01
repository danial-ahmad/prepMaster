class News {
  final int id;
  final String headline;
  final String news_detail;
  final String datetime;

  News._({this.headline, this.news_detail, this.id, this.datetime});

  factory News.fromJson(Map<String, dynamic> json) {
    return News._(
        id: json['newsid'],
        headline: json['headline'],
        news_detail: json['news_detail'],
        datetime: json['date_time']);
  }
}
