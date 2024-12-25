import 'package:events/core/constants/color_constant.dart';
import 'package:flutter/material.dart';

class CustomPostsContainer extends StatefulWidget {
  const CustomPostsContainer({super.key});

  @override
  State<CustomPostsContainer> createState() => _CustomPostsContainerState();
}

class _CustomPostsContainerState extends State<CustomPostsContainer> {
  List<String> postImagesList = [
    "https://images.pexels.com/photos/1666021/pexels-photo-1666021.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/1658967/pexels-photo-1658967.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/2526431/pexels-photo-2526431.jpeg?auto=compress&cs=tinysrgb&w=600",
  ];

  int currentPage = 1;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: ColorConstants.primaryWhite,

        // #1 custom profile & name

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              leading: CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage("asstes/images/Profile 01.jpg"),
              ),
              title: Row(
                children: [
                  Text(
                    "_hus__ain_",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              subtitle: Text(
                "Kannur, Kerala",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: Icon(Icons.more_horiz),
              iconColor: ColorConstants.primaryBlack,
            ),

            // #2 Pic Posts

            Stack(
              children: [
                SizedBox(
                  height: 375,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      currentPage = value + 1;
                      setState(() {});
                    },
                    itemCount: postImagesList.length,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(postImagesList[index]))),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorConstants.primaryBlack.withOpacity(.8)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      "$currentPage/${postImagesList.length}",
                      style: const TextStyle(
                        color: ColorConstants.primaryWhite,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),

            // #3  Likes,Comment,Share, Save option

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.favorite_border_outlined,
                      size: 30,
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Image(
                      image: NetworkImage(
                        "https://cdn-icons-png.flaticon.com/128/5948/5948565.png",
                        scale: 5,
                      ),
                      color: ColorConstants.primaryBlack,
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Image(
                      image: NetworkImage(
                        "https://cdn-icons-png.flaticon.com/128/4503/4503711.png",
                        scale: 4.3,
                      ),
                      color: ColorConstants.primaryBlack,
                    ),
                  ],
                ),
                Image(
                  image: NetworkImage(
                    "https://cdn-icons-png.flaticon.com/128/9511/9511721.png",
                    scale: 4.3,
                  ),
                  color: Color.fromARGB(255, 250, 148, 148),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
