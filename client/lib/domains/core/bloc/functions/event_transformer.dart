import 'package:doit_fluttter_study/domains/core/stream/stream.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Bloc Event Stream에 Debouncing 기법을 적용합니다.
///
/// 최초 이벤트가 발생 이후 [duration] 시간 안에 다른 이벤트가 없다면 해당 이벤트를 반환합니다.
/// 만약 [duration] 시간 안에 추가 이벤트가 발생한다면, 이전 이벤트는 무시하고 해당 시점 이후로 다시 [duration] 시간 안에 추가 이벤트가 발생했는지 체크합니다.
///
/// ```dart
/// on<BlocEvent>(_onHandler, transform: debounceSequential(const Duration(second: 1));
/// ```
EventTransformer<Event> debounceSequential<Event>(Duration duration) =>
    (events, mapper) => events.debounce(duration).asyncExpand<Event>(mapper);
