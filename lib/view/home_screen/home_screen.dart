import 'package:events/core/constants/color_constant.dart';
import 'package:events/dummy_db.dart';
import 'package:events/view/home_screen/widgets/custom_posts_container.dart';
import 'package:events/view/home_screen/widgets/customs_story_avatar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar

      appBar: AppBar(
        leading: const Icon(
          Icons.camera_alt_outlined,
          color: ColorConstants.primaryBlack,
          size: 30,
        ),
        elevation: 0,
        title: Image.asset(
          "asstes/images/Instagram Logo.png",
          scale: 1.9,
        ),
        centerTitle: true,
        actions: const [
          Align(
            alignment: Alignment.center,
            child: Badge(
              child: Icon(
                Icons.favorite_border,
                color: ColorConstants.primaryBlack,
                size: 35,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Image(
            image: AssetImage("asstes/Icons/chat.png"),
            // height: 20,
            width: 30,
            color: ColorConstants.primaryBlack,
          ),
          SizedBox(
            width: 13,
          ),
        ],
        backgroundColor: ColorConstants.primaryWhite,
      ),

      // #1 custom story section

      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                    DummyDb.storyList.length,
                    (index) => CustomStoryAvatar(
                          proPic: DummyDb.storyList[index]["proPic"],
                          userName: DummyDb.storyList[index]["userName"],
                          isLive: DummyDb.storyList[index]["isLive"],
                        )),
              ),
            ),

            // #2 custom posts

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: DummyDb.homePostsList.length,
              itemBuilder: (context, index) => CustomPostsContainer(
                userName: DummyDb.homePostsList[index]["userName"].toString(),
                proPic: DummyDb.homePostsList[index]["proPic"].toString(),
                location: DummyDb.homePostsList[index]["location"].toString(),
                postImagesList: DummyDb.homePostsList[index]["posts"],
                isLike: DummyDb.homePostsList[index]["liked"],
                caption: DummyDb.homePostsList[index]["caption"].toString(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
