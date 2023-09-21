class User {
  final int? id;
  final String name;
  final String email;
  final String? avatarUrl;

  const User({
    this.id,
    required this.name,
    required this.email,
    this.avatarUrl,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
      id: json["id"],
      name: json["name"],
      email: json["name"],
      avatarUrl: json["imageUrl"]);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatarUrl': avatarUrl,
    };
  }
}
