//User Model
class UserModel {
  final String id;
  final String email;
  final String name;
  final String password;

  UserModel(
      {
        required this.id,
        required this.email,
        required this.name,
        required this.password});

  factory UserModel.fromMap(Map data) {
    return UserModel(
      id: data['uid'],
      email: data['email'] ?? '',
      name: data['name'] ?? '',
     password: data['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() =>
      { "id": id,"email": email, "name": name, "password": password};
}