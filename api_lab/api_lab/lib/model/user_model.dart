class UserModel {
  int? id;
  String? email;
  String? password;
  String? role;
  String? name;
  String? avatar;
  String? token;

  UserModel({
    this.email,
    this.id,
    this.password,
    this.name,
    this.avatar,
    this.token,
    this.role
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    token = json['Authorization'];
    id = json['id'];
    avatar = json['avatar'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['email'] = this.email;
    data['password'] = this.password;
    data['name'] = this.name;
    data['Authorization'] = this.token;
    data['id'] = this.id;
    data['avatar'] = this.avatar;
    data['role'] = this.role;

    return data;
  }
}
