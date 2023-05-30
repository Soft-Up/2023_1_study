import 'package:doit_fluttter_study/domains/doit/domain/models/entities/celebrity.dart';
import 'package:flutter/material.dart';

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
          style: TextStyle(fontSize: 32),
        ),
        Expanded(
            child: ListView(
                shrinkWrap: true,
                scrollDirection: scrollDirection,
                children: List.generate(
                    datas.length,
                    (index) => Stack(
                      alignment: Alignment.bottomRight,
                          children: [
                            Image.network(datas[index].image),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                              Text(datas[index].name),
                              Text(datas[index].gender),
                              Text(datas[index].job),
                            ])
                          ],
                        ))))
      ],
    ));
  }
}
