import 'package:doit_fluttter_study/domains/doit/presentation/blocs/celebrity_bloc/celebrity_bloc.dart';
import 'package:doit_fluttter_study/domains/doit/presentation/pages/home_pages/home_pages_widgets/list_view_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocHomePage extends StatefulWidget {
  const BlocHomePage({super.key, required this.title});

  final String title;

  @override
  State<BlocHomePage> createState() => _BlocHomePageState();
}

class _BlocHomePageState extends State<BlocHomePage> {
  @override
  void initState() {
    super.initState();

    context.read<CelebrityBloc>().add(RefreshCelebrity());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CelebrityBloc, CelebrityBlocState>(
        builder: (celebrityContext, celebrityState) {
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
                if (celebrityState is! CelebrityBlocInit)
                  HomePageListViewWithTheTitle(
                    title: "가로 스크롤",
                    scrollDirection: Axis.horizontal,
                    dataIterable: celebrityState.celebrities,
                  ),
                if (celebrityState is! CelebrityBlocInit)
                  HomePageListViewWithTheTitle(
                    title: "세로 스크롤",
                    scrollDirection: Axis.vertical,
                    dataIterable: celebrityState.celebrities,
                  ),
              ],
            ),
          ));
    });
  }
}
