import 'package:dio/dio.dart';
import 'package:doit_fluttter_study/datas/doit/clients/clients.dart';
import 'package:doit_fluttter_study/datas/doit/repositories/implements/celebirty_repository_impl.dart';
import 'package:doit_fluttter_study/domains/core/http/clients/clients.dart';
import 'package:doit_fluttter_study/domains/doit/domain/services/implements/celebrity_service_impl.dart';
import 'package:doit_fluttter_study/domains/doit/presentation/blocs/celebrity_bloc/celebrity_bloc.dart';
import 'package:doit_fluttter_study/domains/doit/presentation/pages/home_pages/home_pages_widgets/list_view_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocHomePage extends StatefulWidget {
  const BlocHomePage({super.key, required this.title});

  final String title;

  @override
  State<BlocHomePage> createState() => _BlocHomePageState();
}

class _BlocHomePageState extends State<BlocHomePage> {
  late ScrollController _verticalScrollController;
  late ScrollController _horizontalScrollController;

  _handleScroll(
      ScrollController scrollController, CelebrityBloc celebrityBloc) {
    var scrollPosition = scrollController.position;
    if (celebrityBloc.state is! CelebrityBlocInProgress) {
      if (scrollPosition.pixels < -100) {
        celebrityBloc.add(RefreshCelebrity());
      } else if (scrollPosition.userScrollDirection ==
              ScrollDirection.reverse &&
          scrollPosition.atEdge) {
        celebrityBloc.add(ReadNextCelebrity());
      }
    }
  }

  @override
  void initState() {
    super.initState();

    _verticalScrollController = ScrollController();
    _horizontalScrollController = ScrollController();
  }

  @override
  void dispose() {
    _verticalScrollController.dispose();
    _horizontalScrollController.dispose();
    super.dispose();
  }

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
              BlocProvider(
                  create: (_) {
                    CelebrityBloc celebrityBloc = CelebrityBloc(
                        celebrityService: CelebrityServiceImpl(
                            celebrityRepository: CelebrityRepositoryImpl(
                                celebrityClient: CelebrityClientImpl(
                                    doitRestClient: DoitRestClient(Dio())))))
                      ..add(RefreshCelebrity());
                    _horizontalScrollController.addListener(() => _handleScroll(
                        _horizontalScrollController, celebrityBloc));
                    return celebrityBloc;
                  },
                  child: Builder(
                      builder: (builderContext) =>
                          BlocBuilder<CelebrityBloc, CelebrityBlocState>(
                              builder: (celebrityContext, celebrityState) {
                            return Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  Text("가로 스크롤",
                                      style: TextStyle(fontSize: 32)),
                                  Expanded(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                        if (celebrityState
                                            is CelebrityBlocRefreshInProgress)
                                          const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20),
                                              child:
                                                  CircularProgressIndicator()),
                                        HomePageListViewWithTheTitle(
                                          title: "가로 스크롤",
                                          scrollController:
                                              _horizontalScrollController,
                                          scrollDirection: Axis.horizontal,
                                          dataIterable:
                                              celebrityState.celebrities,
                                        ),
                                        if (celebrityState
                                            is CelebrityBlocReadNextInProgress)
                                          const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20),
                                              child:
                                                  CircularProgressIndicator()),
                                      ]))
                                ]));
                          }))),
              BlocProvider(
                  create: (_) {
                    CelebrityBloc celebrityBloc = CelebrityBloc(
                        celebrityService: CelebrityServiceImpl(
                            celebrityRepository: CelebrityRepositoryImpl(
                                celebrityClient: CelebrityClientImpl(
                                    doitRestClient: DoitRestClient(Dio())))))
                      ..add(RefreshCelebrity());
                    _verticalScrollController.addListener(() => _handleScroll(
                        _verticalScrollController, celebrityBloc));
                    return celebrityBloc;
                  },
                  child: Builder(
                      builder: (builderContext) =>
                          BlocBuilder<CelebrityBloc, CelebrityBlocState>(
                              builder: (celebrityContext, celebrityState) {
                            return Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                  Text("세로 스크롤",
                                      style: TextStyle(fontSize: 32)),
                                  if (celebrityState
                                      is CelebrityBlocRefreshInProgress)
                                    const Center(
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child:
                                                CircularProgressIndicator())),
                                  HomePageListViewWithTheTitle(
                                    title: "세로 스크롤",
                                    scrollController: _verticalScrollController,
                                    scrollDirection: Axis.vertical,
                                    dataIterable: celebrityState.celebrities,
                                  ),
                                  if (celebrityState
                                      is CelebrityBlocReadNextInProgress)
                                    const Center(
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child:
                                                CircularProgressIndicator())),
                                ]));
                          }))),
            ],
          ),
        ));
  }
}
