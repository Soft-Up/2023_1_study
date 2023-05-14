import 'package:doit_fluttter_study/domains/doit/domain/model/entities/entities.dart';
import 'package:flutter/material.dart';

class HomePageListViewWithTheTitle extends StatelessWidget {
  final String title;
  final ScrollController scrollController;
  final Axis scrollDirection;
  final Iterable<Celebrity> dataIterable;

  const HomePageListViewWithTheTitle({
    super.key,
    required this.title,
    required this.scrollController,
    required this.scrollDirection,
    required this.dataIterable,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
            shrinkWrap: true,
            controller: scrollController,
            scrollDirection: scrollDirection,
            children: List.generate(
                dataIterable.length,
                (index) =>
                    Image.network(dataIterable.elementAt(index).imgUrl))));
  }
}
