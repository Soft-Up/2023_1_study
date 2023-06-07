import 'package:doit_fluttter_study/domains/doit/clients/doit_client.dart';
import 'package:doit_fluttter_study/domains/doit/domain/models/entities/celebrity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "celebrity_event.dart";
part "celebrity_state.dart";

class CelebrityBloc extends Bloc<CelebrityEvent, CelebrityState> {
  CelebrityBloc() : super(CelebrityInitial()) {
    on<RefreshCelebrity>((RefreshCelebrity event, Emitter<CelebrityState> emit) async {
      emit(CelebrityProgress(celebrities: state.celebrities));
      try {
        final response = await DoitClient().getCelebrity();
        emit(CelebritySucess(celebrities: response));
      } catch (e) {
        emit(CelebrityFailed(celebrities: state.celebrities));
      }
    });
    on<ReadNextCelebrity>((ReadNextCelebrity event, Emitter<CelebrityState> emit) async {
      emit(CelebrityProgress(celebrities: state.celebrities));
      try {
        final response = await DoitClient().getCelebrity();
        emit(CelebritySucess(celebrities: [...state.celebrities, ...response]));
      } catch (e) {
        emit(CelebrityFailed(celebrities: state.celebrities));
      }
    });
  }
}
