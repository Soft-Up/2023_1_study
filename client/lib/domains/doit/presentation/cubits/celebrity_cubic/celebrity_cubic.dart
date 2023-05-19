import 'package:doit_fluttter_study/domains/doit/domain/model/entities/entities.dart';
import 'package:doit_fluttter_study/domains/doit/domain/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'celebrity_state.dart';

/// 연예인 정보와 관련된 비즈니스 로직을 처리하는 Cubic입니다.
///
/// [_celebrityService]는 private로 만들어, Presentation layer(UI)에서 Domain layer로 접근하지 못 하도록 합니다.
class CelebrityCubic extends Cubit<CelebrityCubicState> {
  final CelebrityService _celebrityService;

  CelebrityCubic({required CelebrityService celebrityService})
      : _celebrityService = celebrityService,
        super(CelebrityCubicInit());

  Future<void> refreshCelebrity() async {
    emit(CelebrityCubicInProgress(celebrities: state.celebrities));
    try {
      final result = await _celebrityService.getCelebrity();
      emit(CelebrityCubicSuccess(celebrities: result));
    } catch (e) {
      emit(CelebrityCubicFailed(celebrities: state.celebrities));
    }
  }

  Future<void> readNextCelebrity() async {
    emit(CelebrityCubicInProgress(celebrities: state.celebrities));
    try {
      final result = await _celebrityService.getCelebrity();
      emit(CelebrityCubicSuccess(
          celebrities: [...state.celebrities, ...result]));
    } catch (e) {
      emit(CelebrityCubicFailed(celebrities: state.celebrities));
    }
  }
}
