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
    on<GetCelebrity>(_onGet);
  }

  Future<void> _onGet(
      GetCelebrity event, Emitter<CelebrityBlocState> emit) async {
    emit(CelebrityBlocInProgress());
    try {
      await _celebrityService.getCelebrity();
      emit(CelebrityBlocSuccess());
    } catch (e) {
      emit(CelebrityBlocFailed());
    }
  }
}
