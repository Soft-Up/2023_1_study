import 'dart:async';

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
