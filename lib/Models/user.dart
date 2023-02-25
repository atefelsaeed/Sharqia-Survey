class User {
  late final int id;
  late final String name;
  late final String email;
  late final String password;
  // late final int review;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    // required this.review,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    password = json['password'];
    email = json['email'];
    // review = json['review'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['password'] = password;
    data['email'] = email;
    // data['review'] = review;
    return data;
  }
}
