import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String userName;
  final String fullName;
  final String email;
  final String password;
  final String date;
  final String phone;
  final String uId;
  final String genderUser;
  final String typeAccount;
  final String technical;
  final String city;
  final String imageUri;
  final double rating;
  final double rateApp;
  final String rateMsgApp;
  final Timestamp createAt;

  UserModel(
      {required this.userName,
        required this.rating,
        required this.rateApp,
        required this.rateMsgApp,
        required this.fullName,
        required this.email,
        required this.password,
        required this.date,
        required this.phone,
        required this.uId,
        required this.genderUser,
        required this.typeAccount,
        required this.technical,
        required this.city,
        required this.imageUri,
        required this.createAt});

  factory UserModel.formJson(Map<String, dynamic> json,){
    return UserModel(
      userName: json['Name'],
      fullName: json['FullName'],
      email:json['Email'],
      password: json['Password'],
      createAt: json['CreateAt'],
      uId: json['Id'],
      typeAccount: json['TypeAccount'],
      phone: json['Phone'],
      date: json['Date'],
      genderUser: json['GenderUser'],
      technical: json['Technical'],
      city: json['Country'],
      imageUri: json['ImageUri'],
      rating: json['Rating'],
      rateApp: json['RateApp'],
      rateMsgApp: json['RateMsgApp'],
    );
  }

  Map<String,dynamic> toMap(){
    return {
      'Name': userName,
      'FullName': fullName,
      'Email':email,
      'Id': uId,
      'CreateAt':createAt,
      'Password':password,
      'TypeAccount':typeAccount,
      'Phone':phone,
      'Date':date,
      'GenderUser':genderUser,
      'Technical':technical,
      'Country':city,
      'ImageUri':imageUri,
      'Rating':rating,
      'RateApp':rateApp,
      'RateMsgApp':rateMsgApp,
    };
  }
}