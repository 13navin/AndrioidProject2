class Job {
  final int id;
  final String user;
  final String title;
  final String date;
  final String description;
  final String image;

  Job(this.id,this.user, this.title, this.date, this.description, this.image);

  // rceate a Job object from JSON data
  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      json['id'] as int,
      json['user'] as String,
      json['title'] as String,
      json['date'] as String,
      json['description'] as String,
      json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'user': user,
      'title': title,
      'date': date,
      'description': description,
      'image': image,
    };
  }
}