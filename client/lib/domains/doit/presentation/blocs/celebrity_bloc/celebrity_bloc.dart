import 'dart:async';

import 'package:doit_fluttter_study/domains/doit/domain/model/entities/entities.dart';
import 'package:doit_fluttter_study/domains/doit/domain/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'celebrity_event.dart';

part 'celebrity_state.dart';

extension Debounce<T> on Stream<T> {
  Stream<T> debounce(Duration duration) {
    Timer? timer;

    return transform(StreamTransformer.fromHandlers(handleData: (event, sink) {
      if (timer?.isActive ?? false) {
        timer?.cancel();
      }

      timer = Timer(const Duration(milliseconds: 250), () {
        sink.add(event);
      });
    }));
  }
}

EventTransformer<Event> debounceSequential<Event>(Duration duration) =>
    (events, mapper) => events.debounce(duration).asyncExpand(mapper);

class CelebrityBloc extends Bloc<CelebrityBlocEvent, CelebrityBlocState> {
  final CelebrityService _celebrityService;

  CelebrityBloc({required CelebrityService celebrityService})
      : _celebrityService = celebrityService,
        super(CelebrityBlocInit()) {
    on<RefreshCelebrity>(_onRefresh,
        transformer: debounceSequential<RefreshCelebrity>(
            const Duration(milliseconds: 250)));
    on<ReadNextCelebrity>(_onReadNext);
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
