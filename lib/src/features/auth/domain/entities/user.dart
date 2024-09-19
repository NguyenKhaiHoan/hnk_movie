class UserInfomation {
  String? name;
  String? email;
  String? urlToImage;
  String? id;
  UserInfomation({
    this.name,
    this.email,
    this.urlToImage,
    this.id,
  });
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'urlToImage': urlToImage,
      'id': id,
    };
  }

  factory UserInfomation.fromJson(Map<String, dynamic> json) {
    return UserInfomation(
      name: json['name'],
      email: json['email'],
      urlToImage: json['urlToImage'],
      id: json['id'],
    );
  }

  @override
  String toString() {
    return 'UserInfomation(id: $id, name: $name, email: $email, urlToImage: $urlToImage)';
  }
}
