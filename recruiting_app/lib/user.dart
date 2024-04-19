class UserDetails {
  String user;
  String position;
  String company;
  String userdesc;
  String email;
  String phone;
  String photo;

  UserDetails({
    required this.user,
    required this.position,
    required this.company,
    required this.userdesc,
    required this.email,
    required this.phone,
    required this.photo,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      user: json['user'] ?? '',
      position: json['position'] ?? '',
      company: json['company'] ?? '',
      userdesc: json['userdesc'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      photo: json['photo'] ?? '',
    );
  }
}