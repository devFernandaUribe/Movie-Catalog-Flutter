import 'package:flutter/material.dart';
import 'package:movie_catalog_app/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 172, 207, 212),
        body: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/black_popcorn.png', height: 120),
                  Text(
                    "Cinema Catalog",
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
