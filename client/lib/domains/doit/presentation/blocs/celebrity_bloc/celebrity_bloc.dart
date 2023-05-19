import 'dart:async';

import 'package:doit_fluttter_study/domains/core/bloc/bloc.dart';
import 'package:doit_fluttter_study/domains/doit/domain/model/entities/entities.dart';
import 'package:doit_fluttter_study/domains/doit/domain/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'celebrity_event.dart';

part 'celebrity_state.dart';

class CelebrityBloc extends Bloc<CelebrityBlocEvent, CelebrityBlocState> {
  final CelebrityService _celebrityService;

  CelebrityBloc({required CelebrityService celebrityService})
      : _celebrityService = celebrityService,
        super(CelebrityBlocInit()) {
    on<SubscribeCelebrity>(_onSubscribe);
    on<RefreshCelebrity>(_onRefresh,
        transformer: debounceSequential<RefreshCelebrity>(
            const Duration(milliseconds: 250)));
    on<ReadNextCelebrity>(_onReadNext);
  }

  Future<void> _onSubscribe(
      SubscribeCelebrity event, Emitter<CelebrityBlocState> emit) async {
    await emit.forEach(_celebrityService.celebrityIterableStream,
        onData: (Iterable<Celebrity> celebrities) {
      return CelebrityBlocSuccess(celebrities: celebrities);
    }, onError: (e, s) {
      return CelebrityBlocFailed(celebrities: state.celebrities);
    });
  }

  Future<void> _onRefresh(
      RefreshCelebrity event, Emitter<CelebrityBlocState> emit) async {
    emit(CelebrityBlocRefreshInProgress(celebrities: state.celebrities));
    try {
      final result = await _celebrityService.getCelebrity();
      emit(CelebrityBlocSuccess(celebrities: result));
    } catch (e) {
      emit(CelebrityBlocFailed(celebrities: state.celebrities));
    }
  }

  Future<void> _onReadNext(
      ReadNextCelebrity event, Emitter<CelebrityBlocState> emit) async {
    emit(CelebrityBlocReadNextInProgress(celebrities: state.celebrities));
    try {
      final result = await _celebrityService.getCelebrity();
      emit(
          CelebrityBlocSuccess(celebrities: [...state.celebrities, ...result]));
    } catch (e) {
      emit(CelebrityBlocFailed(celebrities: state.celebrities));
    }
  }
}
