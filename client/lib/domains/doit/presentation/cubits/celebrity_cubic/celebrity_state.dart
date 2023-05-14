part of 'celebrity_cubic.dart';

abstract class CelebrityCubicState extends Equatable {
  final Iterable<Celebrity> celebrities;

  const CelebrityCubicState({required this.celebrities});

  @override
  List<Object?> get props => [runtimeType, celebrities];
}

class CelebrityCubicInit extends CelebrityCubicState {
  CelebrityCubicInit() : super(celebrities: []);
}

class CelebrityCubicInProgress extends CelebrityCubicState {
  const CelebrityCubicInProgress({required super.celebrities});
}

class CelebrityCubicSuccess extends CelebrityCubicState {
  const CelebrityCubicSuccess({required super.celebrities});
}

class CelebrityCubicFailed extends CelebrityCubicState {
  const CelebrityCubicFailed({required super.celebrities});
}
