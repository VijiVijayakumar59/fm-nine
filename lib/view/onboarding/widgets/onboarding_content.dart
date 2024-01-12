import 'package:flutter/material.dart';
import 'package:fmnine/core/colors/colors.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key,
    required this.image,
    required this.title1,
    required this.description1,
    required this.description2,
  }) : super(key: key);
  final String image, title1, description1, description2;

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    // var height = size.height;
    // var width = size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Container(
            height: 350,
            width: 400,
            decoration: BoxDecoration(
              // color: Colors.white38,
              // gradient: RadialGradient(colors: [
              //   Color.fromRGBO(255, 255, 255, 1),
              //   Color.fromARGB(255, 255, 8, 8),
              // ], radius: 1),
              border: Border.all(
                width: 2.0,
                color: whiteColor,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  600,
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
          // width: width / 1,
          // height: height / 2,
          // decoration: BoxDecoration(
          //   gradient: RadialGradient(colors: [
          //     Color.fromARGB(255, 247, 244, 244),
          //     Color.fromARGB(255, 245, 221, 221),
          //   ], radius: 1),
          //   borderRadius: BorderRadius.circular(30),
          //   // image: DecorationImage(
          //   //   image: AssetImage(image),
          //   //   fit: BoxFit.cover,
          //   // )
          // ),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            title1,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            description1,
            style: const TextStyle(
              letterSpacing: .5,
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Center(
          child: Text(
            description2,
            style: const TextStyle(
              letterSpacing: .5,
              fontSize: 20,
              color: Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 0,
        ),
      ],
    );
  }
}
