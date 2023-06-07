import 'package:doit_fluttter_study/domains/doit/business/blocs/celebrity/celebrity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageListViewWithTheTitle extends StatelessWidget {
  final String title;
  final Axis scrollDirection;

  const HomePageListViewWithTheTitle({
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
          style: const TextStyle(fontSize: 32),
        ),
        Expanded(
          child: BlocBuilder<CelebrityBloc, CelebrityState>(
            builder: (celebrityContext, celebrityState) {
              if (celebrityState is CelebrityInitial) {
                return const Center(child: Text("데이터가 없어요", style: TextStyle(fontSize: 50)));
              }
              if (celebrityState is CelebrityProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView(
                  shrinkWrap: true,
                  scrollDirection: scrollDirection,
                  children: List.generate(
                      celebrityState.celebrities.length,
                      (index) => Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Image.network(celebrityState.celebrities.elementAt(index).image),
                              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                                Text(celebrityState.celebrities.elementAt(index).name),
                                Text(celebrityState.celebrities.elementAt(index).gender),
                                Text(celebrityState.celebrities.elementAt(index).job),
                              ])
                            ],
                          )));
            },
          ),
        ),
      ],
    ));
  }
}
