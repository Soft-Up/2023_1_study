
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePageListViewWithTheTitle extends StatelessWidget {
  final String title;
  final Axis scrollDirection;
  final ScrollController _scrollController=ScrollController();
  HomePageListViewWithTheTitle({
    super.key,
    required this.title,
    required this.scrollDirection,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 32),
        ),

        Expanded(
        child: Scrollbar(
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          shrinkWrap: true,
          scrollDirection: scrollDirection,
          children: [
            Container(
              color: Colors.red,
              height: 200,
              width: 200,
            ),
            Container(
              color: Colors.yellow,
              height: 200,
              width: 200,
            ),
            Container(
              color: Colors.blue,
              height: 200,
              width: 200,
            ),
            Container(
              color: Colors.green,
              height: 200,
              width: 200,
            ),
          ],
        )))]  
          ));
  }
}
