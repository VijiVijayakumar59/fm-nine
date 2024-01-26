// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fmnine/view/authentication/login_with.dart';
import 'package:fmnine/view/home/screens/home_screen.dart';
import 'package:fmnine/viewModel/shorts/video_likes.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  GoogleSignIn googleSignIn = GoogleSignIn();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
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
  runApp(MyApp(
    isLoggedIn: isLoggedIn,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isLoggedIn;
  const MyApp({super.key, this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LikedVideosProvider()),
      ],
      child: MaterialApp(
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
        home: isLoggedIn! ? const HomeScreen() : const LoginScreen(),
      ),
    );
  }
}
