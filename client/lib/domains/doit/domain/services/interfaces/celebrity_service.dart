import 'package:doit_fluttter_study/domains/doit/domain/model/entities/entities.dart';

/// 연예인 정보와 관련하여 Repository layer와 Domain layer입니다.
///
/// 현재 이 프로젝트에서는 사실 필요 없습니다. 하지만 Bloc layer와 Repository layer 사이에 추가 layer가 필요할 경우, Domain layer를 도입하시면 좋습니다.
abstract class CelebrityService {
  Stream<Iterable<Celebrity>> get celebrityIterableStream;

  Future<Iterable<Celebrity>> getCelebrity();
}