class Post {
  String user;
  String time;
  String title;
  String desc;

  Post(this.user, this.time, this.title, this.desc);

  // Convert post object to JSON
  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'time': time,
      'title': title,
      'desc': desc,
    };
  }

  // Create post object from JSON
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      json['user'],
      json['time'],
      json['title'],
      json['desc'],
    );
  }
}