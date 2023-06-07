part of "celebrity_bloc.dart";

abstract class CelebrityState extends Equatable {
  final Iterable<Celebrity> celebrities;

  const CelebrityState({required this.celebrities});

  @override
  List<Object> get props => [runtimeType, celebrities];
}

class CelebrityInitial extends CelebrityState {
  CelebrityInitial() : super(celebrities: []);
}

class CelebrityProgress extends CelebrityState {
  const CelebrityProgress({required super.celebrities});
}

class CelebritySucess extends CelebrityState {
  const CelebritySucess({required super.celebrities});
}

class CelebrityFailed extends CelebrityState {
  const CelebrityFailed({required super.celebrities});
}
