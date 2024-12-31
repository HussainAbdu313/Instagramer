import 'package:flutter/material.dart';

class CustomSearchResultGrid extends StatefulWidget {
  const CustomSearchResultGrid({super.key});

  @override
  State<CustomSearchResultGrid> createState() => _CustomSearchResultGridState();
}

class _CustomSearchResultGridState extends State<CustomSearchResultGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    color: Colors.yellow,
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    color: Colors.green,
                    height: 100,
                    width: 100,
                  )
                ],
              ),
              Expanded(
                child: Container(
                  height: 200,
                  color: Colors.blue,
                ),
              )
            ],
          ),
          GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) => Container(
                    color: Colors.red,
                  ))
        ],
      ),
    );
  }
}
