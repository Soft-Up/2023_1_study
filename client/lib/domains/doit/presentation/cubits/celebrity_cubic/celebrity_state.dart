part of 'celebrity_cubic.dart';

abstract class CelebrityCubicState extends Equatable {
  @override
  List<Object?> get props => [runtimeType];
}

class CelebrityCubicInit extends CelebrityCubicState {}
