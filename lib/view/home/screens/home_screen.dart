// ignore_for_file: avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fmnine/core/colors/colors.dart';
import 'package:fmnine/models/services/auth_services/google_sign_in.dart';
import 'package:fmnine/view/authentication/login_with.dart';
import 'package:fmnine/view/home/screens/radio.dart';
import 'package:fmnine/view/home/widgets/drawer_elevated_button.dart';
import 'package:fmnine/view/news/screens/news_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  static const List<Widget> widgetOptions = <Widget>[
    RadioScreen(),
    ShortNews(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 249, 195, 195),
          title: SizedBox(
            height: MediaQuery.of(context).size.height * 0.078,
            child: Image.asset(
              "assets/images/FM 9  Logo.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 252, 30, 5),
                      Color.fromARGB(255, 251, 162, 162),
                      Color.fromARGB(255, 248, 17, 17),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "FM 9",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 28,
                      child: Icon(
                        Icons.person_2_outlined,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "Username",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const DrawerElevatedButton(
                text: "Settings",
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Dark Theme",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Switch(
                  //   onChanged: toggleSwitch,
                  //   value: isSwitched,
                  //   activeColor: Colors.red,
                  //   activeTrackColor: whiteColor,
                  //   inactiveThumbColor: Colors.red,
                  //   inactiveTrackColor: whiteColor,
                  // ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 80,
                  right: 80,
                  bottom: 20,
                  top: 400,
                ),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.red,
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          // backgroundColor: blackColor,
                          title: const Text(
                            'Log Out',
                          ),
                          content: const Text(
                            'Are you sure you want to log out?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('CANCEL'),
                            ),
                            TextButton(
                              onPressed: () async {
                                await FirebaseServices().signOutFromGoogle();

                                FirebaseAuth.instance.signOut().then(
                                  (value) {
                                    print("Signed Out");
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen(),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: const Text(
                                'Log Out',
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text(
                    "Log out",
                    style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: widgetOptions.elementAt(selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.radio,
                size: 28,
              ),
              label: 'Radio',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.play_circle_outline,
                size: 28,
              ),
              label: 'News',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(255, 233, 19, 4),
          currentIndex: selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: blackColor,
          unselectedLabelStyle: const TextStyle(
            color: greyColor,
          ),
          iconSize: 38,
          elevation: 5,
          onTap: onItemTapped,
          selectedFontSize: 16,
          unselectedFontSize: 13,
        ),
      ),
    );
  }
}
