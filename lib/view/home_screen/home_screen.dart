import 'package:events/view/home_screen/widgets/customs_story_avatar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomStoryAvatar(),
    );
  }
}
