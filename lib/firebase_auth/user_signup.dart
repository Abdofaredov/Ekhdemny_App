// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ekhdemny/helper/show_snack_bar.dart';
// import 'package:ekhdemny/model/user_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

//  userSignUp({
//   required BuildContext context, // <-- إضافة متطلبات الوسيطة
//   required String email,
//   required String password,
//   required String userName,
//   required String typeAccount,
//   required String city,
//   required String date,
//   required String fullName,
//   required String genderUser,
//   required String phone,
//   required String technical,
// }) {
//   FirebaseAuth.instance
//       .createUserWithEmailAndPassword(email: email, password: password)
//       .then((value) {
//         UserModel model = UserModel(
//             imageUri:
//                 'https://media.istockphoto.com/id/1223671392/vector/default-profile-picture-avatar-photo-placeholder-vector-illustration.jpg?s=612x612&w=0&k=20&c=s0aTdmT5aU6b8ot7VKm11DeID6NctRCpB755rA1BIP0=',
//             userName: userName,
//             typeAccount: typeAccount,
//             email: email,
//             uId: value.user!.uid,
//             city: city,
//             date: date,
//             fullName: fullName,
//             genderUser: genderUser,
//             phone: phone,
//             technical: technical,
//             password: password,
//             rateApp: 0.0,
//             rateMsgApp: '',
//             rating: 5.0,
//             createAt: Timestamp.now());
//         FirebaseFirestore.instance
//             .collection('Users')
//             .doc(value.user!.uid)
//             .set(model.toMap())
//             .then((value) {})
//             .catchError((error) {
//               if (error is FirebaseAuthException) {
// if (error.code == 'weak-password') {
//             showSnackBar(context, 'كلمة المرور يجب أن تحتوي على 6 أحرف على الأقل');
//           } else if (error.code == 'email-already-in-use') {
//             showSnackBar(context, 'البريد الإلكتروني مسجل بالفعل');
//                 }
//               }
//             });
//       });
// }
