class User {
  User({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.role,
    required this.avatar,
    required this.creationAt,
    required this.updatedAt,
  });
  late final int id;
  late final String email;
  late final String password;
  late final String name;
  late final String role;
  late final String avatar;
  late final String creationAt;
  late final String updatedAt;
  
  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    role = json['role'];
    avatar = json['avatar'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['email'] = email;
    _data['password'] = password;
    _data['name'] = name;
    _data['role'] = role;
    _data['avatar'] = avatar;
    _data['creationAt'] = creationAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}