import 'package:doit_fluttter_study/datas/doit/clients/clients.dart';
import 'package:doit_fluttter_study/datas/doit/repositories/implements/celebirty_repository_impl.dart';
import 'package:doit_fluttter_study/domains/doit/domain/services/implements/celebrity_service_impl.dart';
import 'package:doit_fluttter_study/domains/doit/presentation/blocs/celebrity_bloc/celebrity_bloc.dart';
import 'package:doit_fluttter_study/domains/doit/presentation/cubits/celebrity_cubic/celebrity_cubic.dart';
import 'package:doit_fluttter_study/domains/doit/presentation/pages/home_pages/bloc_home_page.dart';
import 'package:doit_fluttter_study/domains/doit/presentation/pages/home_pages/cubic_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    builder: (_) => BlocProvider(
                        create: (_) => CelebrityBloc(
                            celebrityService: CelebrityServiceImpl(
                                celebrityRepository: CelebrityRepositoryImpl(
                                    celebrityClient: CelebrityClientImpl()))),
                        child: BlocHomePage(title: "Bloc 페이지"))));
              },
              child: Text("Bloc 페이지")),
          OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BlocProvider(
                        create: (_) => CelebrityCubic(
                            celebrityService: CelebrityServiceImpl(
                                celebrityRepository: CelebrityRepositoryImpl(
                                    celebrityClient: CelebrityClientImpl()))),
                        child: CubicHomePage(title: "Cubic 페이지"))));
              },
              child: Text("Cubic 페이지")),
        ],
      ),
    );
  }
}
