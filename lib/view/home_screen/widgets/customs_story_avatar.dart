import 'package:events/core/constants/color_constant.dart';
import 'package:flutter/material.dart';

class CustomStoryAvatar extends StatelessWidget {
  const CustomStoryAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //  #1 First Circle in Story

            Stack(
              alignment:
                  AlignmentDirectional.center, // Live Containor center veruvann
              children: [
                const SizedBox(
                  height: 120,
                ),
                Container(
                  padding: const EdgeInsets.all(3),
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [
                        Colors.red,
                        Colors.blue,
                        Colors.yellow,
                      ])),

                  // #2 second circle in story

                  child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: ColorConstants.lightGrey,
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        backgroundImage:
                            AssetImage("asstes/images/Profile 01.jpg"),
                      )),
                ),

                // #3 Live Notification in story

                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 5,
                          color: Colors.white,
                        )),
                    child: const Text(
                      "Live",
                      style: TextStyle(
                        color: ColorConstants.primaryWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            // #4 Story users name

            const Text('User Name')
          ],
        ),
      ),
    );
  }
}
