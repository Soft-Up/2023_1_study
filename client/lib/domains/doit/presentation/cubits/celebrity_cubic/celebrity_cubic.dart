import 'package:doit_fluttter_study/domains/doit/domain/model/entities/entities.dart';
import 'package:doit_fluttter_study/domains/doit/domain/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'celebrity_state.dart';

class CelebrityCubic extends Cubit<CelebrityCubicState> {
  final CelebrityService _celebrityService;

  CelebrityCubic({required CelebrityService celebrityService})
      : _celebrityService = celebrityService,
        super(CelebrityCubicInit());

  Future<Iterable<Celebrity>> getCelebrity() async =>
      await _celebrityService.getCelebrity();
}
