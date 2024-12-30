import 'package:events/core/constants/color_constant.dart';
import 'package:events/view/Search_screen/search_screen.dart';
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
    const SearchScreen(),
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
                activeIcon: Icon(
                  Icons.home,
                  size: 30,
                  color: ColorConstants.primaryBlack,
                ),
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                label: ""),

            // #2 Search

            const BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.search_rounded,
                  size: 30,
                  color: ColorConstants.primaryBlack,
                ),
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
                label: ""),

            // #3 add post

            BottomNavigationBarItem(
                icon: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all()),
                  child: const Icon(
                    Icons.add_box_outlined,
                  ),
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

            const BottomNavigationBarItem(
              activeIcon: CircleAvatar(
                backgroundColor: ColorConstants.primaryBlack,
                radius: 15,
                child: Center(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/17896705/pexels-photo-17896705/free-photo-of-person-in-latex-suit-with-black-horns.jpeg?auto=compress&cs=tinysrgb&w=600",
                    ),
                    radius: 16,
                  ),
                ),
              ),
              icon: CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(
                  "https://images.pexels.com/photos/17896705/pexels-photo-17896705/free-photo-of-person-in-latex-suit-with-black-horns.jpeg?auto=compress&cs=tinysrgb&w=600",
                ),
              ),
              label: "",
            )
          ]),
    );
  }
}
