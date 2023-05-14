import 'package:doit_fluttter_study/datas/doit/clients/implements/implemenets.dart';
import 'package:doit_fluttter_study/datas/doit/clients/interfaces/interfaces.dart';
import 'package:doit_fluttter_study/datas/doit/repositories/implements/celebirty_repository_impl.dart';
import 'package:doit_fluttter_study/domains/doit/domain/services/implements/celebrity_service_impl.dart';
import 'package:doit_fluttter_study/domains/doit/domain/services/interfaces/celebrity_service.dart';
import 'package:doit_fluttter_study/domains/doit/presentation/home_pages/home_pages_widgets/list_view_with_title.dart';
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
          leading: const Icon(Icons.menu, color: Colors.black),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text("Find your", style: TextStyle(fontSize: 30)),
              const Text("Inspiration", style: TextStyle(fontSize: 48)),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16)),
                child: const TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      hintText: "검색어를 입력해주세요"),
                ),
              ),
              OutlinedButton(
                  onPressed: () {
                    CelebrityService celebrityService = CelebrityServiceImpl(celebrityRepository: CelebrityRepositoryImpl(celebrityClient: CelebrityClientImpl()));
                    celebrityService
                        .getCelebrity()
                        .then((value) => value.forEach(print));
                  },
                  child: Text("API TEST")),
              const HomePageListViewWithTheTitle(
                title: "가로 스크롤",
                scrollDirection: Axis.horizontal,
              ),
              const HomePageListViewWithTheTitle(
                title: "세로 스크롤",
                scrollDirection: Axis.vertical,
              ),
            ],
          ),
        ));
  }
}
