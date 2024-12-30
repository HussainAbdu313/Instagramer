import 'package:events/core/constants/color_constant.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryWhite,

        // #1 Search bar

        title: TextField(
          decoration: InputDecoration(
              hintText: "Search",
              prefixIconConstraints:
                  const BoxConstraints(minWidth: 30, minHeight: 40),
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: Colors.grey,
                size: 20,
              ),
              isDense: true,
              filled: true,
              fillColor: ColorConstants.primaryBlack.withOpacity(.1),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}
