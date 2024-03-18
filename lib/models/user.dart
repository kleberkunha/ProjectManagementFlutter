import 'dart:convert';

class User{
   int id;
   String username;
   String email;

  User(this.id, this.username, this.email);


  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'] as int,
      json['username'] as String,
      json['email'] as String,
    );
  }
}