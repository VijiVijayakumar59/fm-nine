import 'package:flutter/material.dart';
import 'package:fmnine/core/colors/colors.dart';
import 'package:fmnine/core/constants/constants.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  var val = 5;
  bool isVolumeButtonPressed = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: DecoratedBox(
            decoration: const BoxDecoration(
              gradient: RadialGradient(colors: [
                Color.fromARGB(255, 246, 229, 229),
                Color.fromARGB(255, 247, 244, 244),
              ], radius: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const KHeight(
                    size: 0.01,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "FM 9 Malayalam",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const KHeight(
                    size: 0.04,
                  ),
                  Center(
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        border: Border.all(
                          width: 2.0,
                          color: whiteColor,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            500,
                          ),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Image(
                          image: AssetImage(
                            "assets/images/FM 9  Logo.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                  // const KHeight(
                  //   size: 0.08,
                  // ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isVolumeButtonPressed = !isVolumeButtonPressed;
                          });
                        },
                        icon: const Icon(
                          Icons.volume_down_outlined,
                          size: 34,
                        ),
                      ),
                      Visibility(
                        visible: isVolumeButtonPressed,
                        child: Slider(
                          activeColor: const Color.fromARGB(225, 245, 58, 44),
                          value: val.toDouble(),
                          min: 1.0,
                          max: 10.0,
                          // divisions: 50,
                          inactiveColor: whiteColor,
                          label: '$val',
                          onChanged: (double newValue) {
                            setState(() {
                              val = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  const Text(
                    "FM 9 Funtastic Celebrations...",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      // color: whiteColor,
                    ),
                  ),
                  const KHeight(
                    size: 0.01,
                  ),
                  const Text(
                    "Discussion about",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const KHeight(
                    size: 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => EmailAuthScreen(),
                          //   ),
                          // );
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.12,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color.fromARGB(
                                255,
                                249,
                                205,
                                201,
                              ),
                            ),
                          ),
                          child: const Icon(
                            Icons.skip_previous_outlined,
                          ),
                        ),
                      ),
                      const KWidth(
                        size: 0.1,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => EmailAuthScreen(),
                          //   ),
                          // );
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.14,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color.fromARGB(255, 247, 197, 192),
                            ),
                          ),
                          child: const Icon(
                            Icons.play_arrow_rounded,
                            size: 38,
                          ),
                        ),
                      ),
                      const KWidth(
                        size: 0.1,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => EmailAuthScreen(),
                          //   ),
                          // );
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.12,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color.fromARGB(
                                255,
                                249,
                                205,
                                201,
                              ),
                            ),
                          ),
                          child: const Icon(
                            Icons.skip_next_outlined,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
