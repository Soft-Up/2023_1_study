import 'dart:async';
import 'dart:developer';

import 'package:doit_fluttter_study/domains/doit/domain/model/entities/entities.dart';
import 'package:doit_fluttter_study/domains/doit/domain/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'celebrity_event.dart';

part 'celebrity_state.dart';

class CelebrityBloc extends Bloc<CelebrityBlocEvent, CelebrityBlocState> {
  final CelebrityService _celebrityService;
  final List<Timer?> _streamTimer = [null, null];

  CelebrityBloc({required CelebrityService celebrityService})
      : _celebrityService = celebrityService,
        super(CelebrityBlocInit()) {
    on<RefreshCelebrity>(_onRefresh,
        transformer: (events, mapper) => events.transform(
                StreamTransformer.fromHandlers(handleData: (event, sink) {
              if (_streamTimer[0]?.isActive ?? false) {
                _streamTimer[0]?.cancel();
              }

              _streamTimer[0] = Timer(const Duration(milliseconds: 250), () {
                mapper.call(event);
              });
            })));
    on<ReadNextCelebrity>(_onReadNext);
  }

  Future<void> _onRefresh(
      RefreshCelebrity event, Emitter<CelebrityBlocState> emit) async {
    log("hello3");
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
