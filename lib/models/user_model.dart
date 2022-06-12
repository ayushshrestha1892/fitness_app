import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  String? age;
  String? weight;
  String? height;

  UserModel(
      {this.uid,
      this.email,
      this.firstName,
      this.lastName,
      this.age,
      this.weight,
      this.height});

  //data from server

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      age: map['age'],
      weight: map['weight'],
      height: map['height'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'weight': weight,
      'height': height,
    };
  }
}
