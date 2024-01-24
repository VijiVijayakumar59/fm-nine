// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:fmnine/core/constants/constants.dart';
// import 'package:fmnine/view/authentication/register/register_screen.dart';
// import 'package:fmnine/view/authentication/login/phone/otp_screen.dart';
// import 'package:fmnine/view/authentication/login/widgets/elevated_button.dart';
// import 'package:fmnine/view/authentication/login/widgets/textform_widget.dart';

// class PhoneAuthScreen extends StatelessWidget {
//   PhoneAuthScreen({super.key});
//   TextEditingController nameController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             icon: const Icon(
//               Icons.arrow_back_ios_new,
//             ),
//           ),
//         ),
//         body: Padding(
//           padding:
//               const EdgeInsets.only(top: 2, left: 20, right: 20, bottom: 8),
//           child: SingleChildScrollView(
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Center(
//                   child: SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.3,
//                     width: MediaQuery.of(context).size.height * 0.3,
//                     child: Image.asset(
//                       "assets/images/FM 9  Logo.png",
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//                 const Text(
//                   "Login",
//                   style: TextStyle(
//                     fontSize: 26,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 // const KHeight(
//                 //   size: 0.02,
//                 // ),
//                 // TextFormWidget(
//                 //   textController: nameController,
//                 //   hintText: "Username",
//                 //   prefixIcon: Icons.person_2_outlined,
//                 // ),
//                 const KHeight(
//                   size: 0.02,
//                 ),
//                 TextFormWidget(
//                   hintText: "Phone number",
//                   textController: phoneController,
//                   prefixIcon: Icons.phone,
//                 ),
//                 const KHeight(
//                   size: 0.02,
//                 ),
//                 const KHeight(
//                   size: 0.02,
//                 ),
//                 ElevatedButtonWidget(
//                   text: "Send OTP",
//                   bgColor: const Color.fromARGB(255, 255, 26, 10),
//                   onPress: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => OtpVerification(
                          
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//                 const KHeight(
//                   size: 0.02,
//                 ),
//                 // const Text(
//                 //   "or sign in with",
//                 //   style: TextStyle(
//                 //       // color: twhitecolor,
//                 //       ),
//                 // ),
//                 // Row(
//                 //   mainAxisAlignment: MainAxisAlignment.center,
//                 //   children: [
//                 //     FloatingActionButton(
//                 //       backgroundColor: whiteColor,
//                 //       onPressed: () {},
//                 //       child: Image.asset(
//                 //         "assets/images/google.jpg",
//                 //         fit: BoxFit.contain,
//                 //         height: 40,
//                 //         width: 40,
//                 //       ),
//                 //     ),
//                 //     const KWidth(size: 0.04),
//                 //     FloatingActionButton(
//                 //       backgroundColor: whiteColor,
//                 //       onPressed: () {},
//                 //       child: Image.asset(
//                 //         "assets/images/facebook logo.png",
//                 //         fit: BoxFit.contain,
//                 //         height: 62,
//                 //         width: 62,
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "New user?",
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) => SignUpScreen(),
//                           ),
//                         );
//                       },
//                       child: const Text(
//                         "Register",
//                         style: TextStyle(
//                           fontSize: 16,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
