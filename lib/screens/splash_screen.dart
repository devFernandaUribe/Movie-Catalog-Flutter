import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "home");
        },
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 172, 207, 212),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icon/black_popcorn.png', height: 120),
                  Text(
                    "Meridian Movie",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )));
  }
}
