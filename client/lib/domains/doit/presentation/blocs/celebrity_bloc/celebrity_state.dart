part of 'celebrity_bloc.dart';

abstract class CelebrityBlocState extends Equatable {
  final Iterable<Celebrity> celebrities;

  const CelebrityBlocState({required this.celebrities});

  @override
  List<Object?> get props => [runtimeType, celebrities];
}

class CelebrityBlocInit extends CelebrityBlocState {
  CelebrityBlocInit() : super(celebrities: []);
}

class CelebrityBlocInProgress extends CelebrityBlocState {
  CelebrityBlocInProgress({required super.celebrities});
}

class CelebrityBlocSuccess extends CelebrityBlocState {
  CelebrityBlocSuccess({required super.celebrities});
}

class CelebrityBlocFailed extends CelebrityBlocState {
  CelebrityBlocFailed({required super.celebrities});
}
