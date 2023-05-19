part of 'celebrity_bloc.dart';

abstract class CelebrityBlocEvent extends Equatable {
  @override
  List<Object?> get props => [runtimeType];
}

/// Data layer를 구독합니다.
class SubscribeCelebrity extends CelebrityBlocEvent {}

/// 연에인 정보를 새로고침합니다.
class RefreshCelebrity extends CelebrityBlocEvent {}

/// 연예인 정보를 추가로 불러옵니다.
class ReadNextCelebrity extends CelebrityBlocEvent {}
