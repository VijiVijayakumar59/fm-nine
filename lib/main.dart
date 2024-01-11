import 'package:flutter/material.dart';
import 'package:fmnine/presentation/authentication/sign_up/screens/sign_up_screen.dart';
// import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Lora",
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 235, 117, 109)),
        useMaterial3: true,
      ),
      home: const SignUpScreen(),
    );
  }
}
