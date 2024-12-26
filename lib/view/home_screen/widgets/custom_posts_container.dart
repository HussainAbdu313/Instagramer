import 'package:events/core/constants/color_constant.dart';
import 'package:flutter/material.dart';

class CustomPostsContainer extends StatefulWidget {
  const CustomPostsContainer({
    super.key,
    required this.userName,
    required this.proPic,
    required this.location,
    required this.postImagesList,
    this.isLike = false,
    this.caption,
  });

  final String userName;
  final String proPic;
  final String location;
  final List<String> postImagesList;
  final bool isLike;
  final String? caption;

  @override
  State<CustomPostsContainer> createState() => _CustomPostsContainerState();
}

class _CustomPostsContainerState extends State<CustomPostsContainer> {
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
            ListTile(
              leading: CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(widget.proPic),
              ),
              title: Row(
                children: [
                  Text(
                    widget.userName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              subtitle: Text(
                widget.location,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: const Icon(Icons.more_horiz),
              iconColor: ColorConstants.primaryBlack,
            ),

            // #2 Pic Posts

            Stack(
              children: [
                SizedBox(
                  height: 370,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      currentPage = value + 1;
                      setState(() {});
                    },
                    itemCount: widget.postImagesList.length,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  NetworkImage(widget.postImagesList[index]))),
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
                      "$currentPage/${widget.postImagesList.length}",
                      style: const TextStyle(
                        color: ColorConstants.primaryWhite,
                      ),
                    ),
                  ),
                )
              ],
            ),

            // #3  Likes,Comment,Share, Save option

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 13.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          widget.isLike == true
                              ? const Icon(
                                  Icons.favorite_rounded,
                                  size: 30,
                                  color: ColorConstants.normalRed,
                                )
                              : const Icon(Icons.favorite_border_outlined,
                                  size: 30),
                          const SizedBox(width: 16),
                          const Image(
                              image: NetworkImage(
                                "https://cdn-icons-png.flaticon.com/128/5948/5948565.png",
                                scale: 5,
                              ),
                              color: ColorConstants.primaryBlack),
                          const SizedBox(width: 16),
                          const Icon(Icons.send, size: 30),
                        ],
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            widget.postImagesList.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.only(
                                    left: 3,
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: (index == currentPage - 1)
                                        ? ColorConstants.normalBlue
                                        : Colors.grey
                                            .withOpacity(.9), // or ( : null,)
                                    radius: (index == currentPage - 1) ? 5 : 3,
                                  ),
                                )),
                      )),
                      const Icon(
                        Icons.bookmark_border,
                        size: 35,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.5,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          widget.proPic,
                        ),
                        radius: 10,
                      ),
                      const SizedBox(width: 14),
                      RichText(
                        text: const TextSpan(
                            text: "Liked by",
                            style:
                                TextStyle(color: ColorConstants.primaryBlack),
                            children: [
                              TextSpan(
                                  text: " user_name ",
                                  style: TextStyle(
                                      color: ColorConstants.primaryBlack,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(text: "and "),
                              TextSpan(
                                  text: "56,756 others",
                                  style: TextStyle(
                                      color: ColorConstants.primaryBlack,
                                      fontWeight: FontWeight.bold)),
                            ]),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                          text: widget.userName,
                          style: const TextStyle(
                              color: ColorConstants.primaryBlack,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text: "${widget.caption}" ?? " ",
                              style: const TextStyle(
                                  color: ColorConstants.primaryBlack,
                                  fontWeight: FontWeight.normal),
                            ),
                          ])),
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    "September 12",
                    style: TextStyle(
                        color: ColorConstants.primaryBlack.withOpacity(.6),
                        fontSize: 13,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
