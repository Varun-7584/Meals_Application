import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? uid;
  String? email;
  String? PhoneNo;
  String? Name;

  UserModel({
    this.uid,
    this.email,
    this.PhoneNo,
    // this.Name,
  });

  //a map
  //receiving
  //data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      PhoneNo: map['PhoneNo'],
      // Name: map['Name'],
    );
  }
//sending the data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'PhoneNo': PhoneNo,
      // 'Name': Name,
    };
  }
}
