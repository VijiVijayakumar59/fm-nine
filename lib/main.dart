import 'package:flutter/material.dart';
import 'package:fmnine/view/splash/splash_screen.dart';

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
      home: const SplashScreen(),
    );
  }
}
