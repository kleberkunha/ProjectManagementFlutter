class User{
   int id;
   String username;
   String email;
   String password;
   String role;

  User(this.id, this.username, this.email, this.password, this.role);


  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'] as int,
      json['username'] as String,
      json['email'] as String,
      json['password'] as String,
      json['role'] as String,
    );
  }
}