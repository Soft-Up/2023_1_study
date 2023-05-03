import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                height: 30,
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
              Expanded(
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Text(
                    "가로 스크롤",
                    style: TextStyle(fontSize: 32),
                  ),
                  Expanded(
                      child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      Container(color: Colors.red, height: 200, width: 200),
                      Container(color: Colors.yellow, height: 200, width: 200),
                      Container(color: Colors.blue, height: 200, width: 200),
                      Container(color: Colors.green, height: 200, width: 200),
                    ],
                  ))
                ],
              )),
              Expanded(
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Text(
                        "세로 스크롤",
                        style: TextStyle(fontSize: 32),
                      ),
                      Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Container(color: Colors.red, height: 200, width: 200),
                              Container(color: Colors.yellow, height: 200, width: 200),
                              Container(color: Colors.blue, height: 200, width: 200),
                              Container(color: Colors.green, height: 200, width: 200),
                            ],
                          ))
                    ],
                  )),
            ],
          ),
        ));
  }
}
