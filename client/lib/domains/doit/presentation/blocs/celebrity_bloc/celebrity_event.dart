part of 'celebrity_bloc.dart';

abstract class CelebrityBlocEvent extends Equatable {
  @override
  List<Object?> get props => [runtimeType];
}

class GetCelebrity extends CelebrityBlocEvent {}
