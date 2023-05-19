import 'dart:async';

/// Stream에 Debouncing 기법을 적용할 수 있습니다..
extension Debounce<T> on Stream<T> {
  /// 최초 이벤트가 발생 이후 [duration] 시간 안에 다른 이벤트가 없다면 해당 이벤트를 반환합니다.
  /// 만약 [duration] 시간 안에 추가 이벤트가 발생한다면, 이전 이벤트는 무시하고 해당 시점 이후로 다시 [duration] 시간 안에 추가 이벤트가 발생했는지 체크합니다.
  ///
  /// ```dart
  /// stream.debounce(duration);
  /// ```
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
