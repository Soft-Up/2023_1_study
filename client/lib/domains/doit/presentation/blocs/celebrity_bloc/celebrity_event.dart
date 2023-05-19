part of 'celebrity_bloc.dart';

abstract class CelebrityBlocEvent extends Equatable {
  @override
  List<Object?> get props => [runtimeType];
}

class SubscribeCelebrity extends CelebrityBlocEvent {}

class RefreshCelebrity extends CelebrityBlocEvent {}

class ReadNextCelebrity extends CelebrityBlocEvent {}
