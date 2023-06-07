part of "celebrity_bloc.dart";

abstract class CelebrityEvent extends Equatable {
  @override
  List<Object> get props => [runtimeType];
}

class RefreshCelebrity extends CelebrityEvent {}

class ReadNextCelebrity extends CelebrityEvent {}
