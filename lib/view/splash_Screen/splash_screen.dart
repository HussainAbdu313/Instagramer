import 'package:events/view/select_account_screen/select_account_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(
      seconds: 3,
    )).then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SelectAccountScreen(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              child: Image.asset(
                "asstes/images/Icon.png",
                scale: 1.5,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Image(
            image: AssetImage("asstes/images/Instagram Logo.png"),
          )
          // const Text(
          //   "Instagram",
          //   style: TextStyle(
          //     fontStyle: FontStyle.italic,
          //     fontWeight: FontWeight.bold,
          //     fontSize: 20,
          //   ),
          // ),
        ],
      ),
    );
  }
}
