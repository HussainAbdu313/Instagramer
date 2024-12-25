import 'package:events/core/constants/color_constant.dart';
import 'package:flutter/material.dart';

class CustomStoryAvatar extends StatelessWidget {
  const CustomStoryAvatar(
      {super.key,
      this.isLive = false,
      required this.proPic,
      required this.userName});

  final String proPic;
  final String userName;
  final bool isLive;

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
                  height: 100,
                ),
                Container(
                  padding: const EdgeInsets.all(3),
                  height: 90,
                  width: 80,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [
                        ColorConstants.normalRed,
                        ColorConstants.primaryBlue,
                        ColorConstants.normalYellow,
                      ])),

                  //  second circle in story

                  child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: ColorConstants.lightGrey,
                        shape: BoxShape.circle,
                      ),
                      child:
                          CircleAvatar(backgroundImage: NetworkImage(proPic))),
                ),

                //  Live Notification in story

                Positioned(
                  bottom: 0,
                  child: isLive == true
                      ? Container(
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
                        )
                      : const SizedBox(),
                )
              ],
            ),
            // const SizedBox(
            //   height: 03,
            // ),

            // #2 Story users name

            Text(userName)
          ],
        ),
      ),
    );
  }
}
