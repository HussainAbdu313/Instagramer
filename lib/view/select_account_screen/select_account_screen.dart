import 'package:events/global_widgets/custom_button.dart';
import 'package:events/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class SelectAccountScreen extends StatelessWidget {
  const SelectAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // #1 Instagram Logo

            Image.asset("asstes/images/Instagram Logo.png"),
            const Align(
              alignment: Alignment.center,
            ),
            const SizedBox(
              height: 15,
            ),

            // #2 Profile

            CircleAvatar(
              child: Image.asset("asstes/images/Profile 01.jpg"),
              radius: 50,
            ),
            const SizedBox(
              height: 10,
            ),

            // #3 Name

            const Text(
              "_hus__sain_",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            // #4 Login Button

            CustomButton(
              text: "Log In",
              onTap: () {
                Navigator.push(
                    (context),
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
              },
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const LoginScreen(),
            //       ),
            //     );
            //   },
            //   child: const Padding(
            //     padding: EdgeInsets.symmetric(
            //       horizontal: 130,
            //     ),
            //     child: Text("Log In"),
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),

            // #5 Switch accounts

            TextButton(
              onPressed: () {},
              child: const Text("Switch Account"),
            ),
          ],
        ),
      ),
    );
  }
}
