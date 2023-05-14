part of 'celebrity_bloc.dart';

abstract class CelebrityBlocState extends Equatable {
  @override
  List<Object?> get props => [runtimeType];
}

class CelebrityBlocInit extends CelebrityBlocState {}

class CelebrityBlocInProgress extends CelebrityBlocState {}

class CelebrityBlocSuccess extends CelebrityBlocState {}

class CelebrityBlocFailed extends CelebrityBlocState {}
