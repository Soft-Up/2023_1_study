import 'package:doit_fluttter_study/domains/doit/presentation/pages/home_pages/bloc_home_page.dart';
import 'package:doit_fluttter_study/domains/doit/presentation/pages/home_pages/cubic_home_page.dart';
import 'package:flutter/material.dart';

class NavigatePage extends StatelessWidget {
  const NavigatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BlocHomePage(title: "Bloc 페이지")));
              },
              child: Text("Bloc 페이지")),
          OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => CubicHomePage(title: "Cubic 페이지")));
              },
              child: Text("Cubic 페이지")),
        ],
      ),
    );
  }
}
