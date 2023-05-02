// ignore_for_file: prefer_const_constructors

import 'package:doit_fluttter_study/domains/doit/presentation/home_pages/home_pages_widgets/list_view_with_the_title.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.black),
        //leading/title/actions
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Find Your",
              style: TextStyle(fontSize: 32, fontFamily: "pretendard"),
            ),
            Text(
              "Inspiration",
              style: TextStyle(fontSize: 48, fontFamily: "pretendard"),
            ),
            const SizedBox(height: 32),
            Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200, borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      hintText: "Search your looking for"),
                )),
            const HomePageListViewWithTheTitle(title: "가로 스크롤", scrollDirection: Axis.horizontal),
            const HomePageListViewWithTheTitle(title: "세로 스크롤", scrollDirection: Axis.vertical),
          ],
        ),
      ),
    );
  }
}
