// // ignore_for_file: use_build_context_synchronously

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ekhdemny/screens/layout_screen.dart';
// import 'package:flutter/material.dart';


// void userLogin(BuildContext context, String email, String password) async {
//   try {
//     final querySnapshot = await FirebaseFirestore.instance
//         .collection('Users')
//         .where('Email', isEqualTo: email)
//         .where('Password', isEqualTo: password)
//         .get();

//     if (querySnapshot.docs.isNotEmpty) {
//       final accountType = querySnapshot.docs.first.get('TypeAccount');
//       if (accountType == "User") {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const LayoutScreen(isUser: true),
//           ),
//         );
//       } else if (accountType == "Technical" || accountType == "Winch owner") {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const LayoutScreen(isUser: false),
//           ),
//         );
//       }
//     }
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Error: ${e.toString()}'),
//       ),
//     );
//   }
// }
