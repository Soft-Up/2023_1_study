import 'dart:async';
import 'dart:developer';

import 'package:doit_fluttter_study/domains/core/bloc/bloc.dart';
import 'package:doit_fluttter_study/domains/doit/domain/model/entities/entities.dart';
import 'package:doit_fluttter_study/domains/doit/domain/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'celebrity_event.dart';

part 'celebrity_state.dart';

/// 연예인 정보와 관련된 비즈니스 로직을 처리하는 Bloc입니다.
///
/// [_celebrityService]는 private로 만들어, Presentation layer(UI)에서 Domain layer로 접근하지 못 하도록 합니다.
class CelebrityBloc extends Bloc<CelebrityBlocEvent, CelebrityBlocState> {
  final CelebrityService _celebrityService;

  CelebrityBloc({required CelebrityService celebrityService})
      : _celebrityService = celebrityService,
        super(CelebrityBlocInit()) {
    on<SubscribeCelebrity>(_onSubscribe);
    on<RefreshCelebrity>(_onRefresh,
        transformer: debounceSequential(const Duration(milliseconds: 250)));
    on<ReadNextCelebrity>(_onReadNext,
        transformer: debounceSequential(const Duration(milliseconds: 250)));
  }

  Future<void> _onSubscribe(
      SubscribeCelebrity event, Emitter<CelebrityBlocState> emit) async {
    await emit.forEach(_celebrityService.celebrityIterableStream,
        onData: (Iterable<Celebrity> celebrities) {
      if (state is CelebrityBlocRefreshInProgress) {
        return CelebrityBlocSuccess(celebrities: celebrities);
      }
      return CelebrityBlocSuccess(
          celebrities: [...state.celebrities, ...celebrities]);
    }, onError: (e, s) {
      return CelebrityBlocFailed(celebrities: state.celebrities);
    });
  }

  Future<void> _onRefresh(
      RefreshCelebrity event, Emitter<CelebrityBlocState> emit) async {
    emit(CelebrityBlocRefreshInProgress(celebrities: state.celebrities));
    try {
      await _celebrityService.getCelebrity();
    } catch (e) {
      emit(CelebrityBlocFailed(celebrities: state.celebrities));
    }
  }

  Future<void> _onReadNext(
      ReadNextCelebrity event, Emitter<CelebrityBlocState> emit) async {
    emit(CelebrityBlocReadNextInProgress(celebrities: state.celebrities));
    try {
      await _celebrityService.getCelebrity();
    } catch (e) {
      emit(CelebrityBlocFailed(celebrities: state.celebrities));
    }
  }
}
