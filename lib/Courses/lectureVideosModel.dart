class LecturesVideos {
  final int id;
  final String videourl;
  final String description;

  LecturesVideos._({this.videourl, this.description, this.id});

  factory LecturesVideos.fromJson(Map<String, dynamic> json) {
    return LecturesVideos._(
      id: json['id'],
      videourl: json['video_url'],
      description: json['v_description'],
    );
  }
}
