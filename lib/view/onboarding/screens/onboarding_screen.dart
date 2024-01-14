import 'package:flutter/material.dart';
import 'package:fmnine/core/colors/colors.dart';
import 'package:fmnine/view/authentication/login_with.dart';
import 'package:fmnine/view/onboarding/widgets/onboard_core.dart';
import 'package:fmnine/view/onboarding/widgets/onboarding_content.dart';
import 'package:fmnine/view/onboarding/widgets/page_indicating_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  late PageController _pageController;
  int pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: demoData.length,
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    pageIndex = value;
                  });
                },
                itemBuilder: (context, index) => OnboardContent(
                  image: demoData[index].image,
                  title1: demoData[index].title1,
                  description1: demoData[index].description1,
                  description2: demoData[index].description2,
                ),
              ),
            ),
            PageIndicator(
              currentValue: pageIndex,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 40,
                right: 20.0,
                bottom: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 17, 0),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginOrSignup(),
                                ));
                          },
                          child: Text('Skip',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  letterSpacing: .5,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic,
                                  color: whiteColor,
                                ),
                              )))
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      pageIndex == 2
                          ? Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginOrSignup(),
                              ))
                          : _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                    },
                    icon: const Icon(
                      Icons.arrow_circle_right_sharp,
                      color: Color.fromARGB(255, 255, 17, 0),
                      size: 50,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  @override
  void dispose() async {
    _pageController.dispose();
    super.dispose();
  }
}
