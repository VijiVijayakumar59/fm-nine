// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fmnine/view/splash/splash_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  GoogleSignIn googleSignIn = GoogleSignIn();
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyCBE99CArQR0LRYWi6Wg99hKNAYtU9Hwl4",
            appId: "1:836402525268:android:e1dca19af17b65314c29c1",
            messagingSenderId: "836402525268",
            projectId: "fm-9-265c9",
          ),
        )
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // darkTheme: darkMode,
      // themeMode: ThemeMode.system,
      theme: ThemeData(
        fontFamily: "Lora",
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 235, 117, 109)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
