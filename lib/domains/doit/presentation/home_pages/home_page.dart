// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_pages_widgets/list_view_with_the_title.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

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
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text("Find your", style: TextStyle(fontSize: 30)),
              Text("Inspiration", style: TextStyle(fontSize: 48)),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16)),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      hintText: "검색어를 입력해주세요"),
                ),
              ),
             HomePageListViewWithTheTitle(title: '가로 스크롤',scrollDirection: Axis.horizontal,),
             HomePageListViewWithTheTitle(title:'세로 스크롤',scrollDirection: Axis.vertical,),
            ],
          ),
        ));
  }
}
