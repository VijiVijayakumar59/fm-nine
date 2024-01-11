import 'package:flutter/material.dart';
import 'package:fmnine/core/colors/colors.dart';
import 'package:fmnine/presentation/home/screens/radio.dart';
import 'package:fmnine/presentation/home/widgets/drawer_elevated_button.dart';
import 'package:fmnine/presentation/news/screens/news_screen.dart';
import 'package:google_fonts/google_fonts.dart';

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
          backgroundColor: const Color.fromARGB(255, 254, 203, 200),
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
              DrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 238, 110, 95),
                      Color.fromARGB(255, 224, 154, 154),
                      Color.fromARGB(255, 205, 56, 56),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "FM 9",
                      style: GoogleFonts.aladin(
                        textStyle: const TextStyle(
                          fontSize: 28,
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 28,
                      child: Icon(
                        Icons.person_2_outlined,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
                    const Text(
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
              // const SizedBox(
              //   height: 10,
              // ),
              // const DrawerElevatedButton(
              //   text: "Our Servies",
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // const DrawerElevatedButton(
              //   text: "Reviews",
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // const DrawerElevatedButton(
              //   text: "Settings",
              // ),
            ],
          ),
        ),
        body: widgetOptions.elementAt(selectedIndex),
        bottomNavigationBar: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 56, // Adjust the height as needed
                color: const Color.fromARGB(
                    255, 254, 203, 200), // Background color for the active item
              ),
            ),
            BottomNavigationBar(
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
              // backgroundColor: Color.fromARGB(255, 244, 188, 184),
              currentIndex: selectedIndex,
              selectedItemColor: Colors.red,
              unselectedItemColor: greyColor,
              unselectedLabelStyle: const TextStyle(
                color: greyColor,
              ),
              iconSize: 40,
              elevation: 5,
              onTap: onItemTapped,
            ),
          ],
        ),
      ),
    );
  }
}
