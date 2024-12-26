import 'package:events/core/constants/color_constant.dart';
import 'package:events/view/home_screen/home_screen.dart';
import 'package:events/view/select_account_screen/select_account_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  List<Widget> screenList = [
    const HomeScreen(),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.white,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    ),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          onTap: (value) {
            if (value != 2) {
              selectedIndex = value; // color single screenil kanikann
              setState(() {});
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectAccountScreen(),
                  ));
            }
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          items: [
            // #1 Home

            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 35,
                  weight: 20,
                  color: ColorConstants.primaryBlack,
                ),
                label: ""),

            // #2 Search

            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 30,
                  color: ColorConstants.primaryBlack,
                ),
                label: ""),

            // #3 add post
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_box_outlined,
                  size: 30,
                  color: ColorConstants.primaryBlack,
                ),
                label: ""),

            // #4 Likes

            const BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage("asstes/Icons/reel.png"),
                  height: 35,
                  color: ColorConstants.primaryBlack,
                  width: 35,
                ),
                label: ""),

            // #5 Profile

            BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: ColorConstants.primaryBlack,
                child: Image.asset("asstes/images/Profile 01.jpg"),
                radius: 20,
              ),
              label: "",
            )
          ]),
    );
  }
}
