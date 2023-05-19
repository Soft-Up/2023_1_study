import 'package:doit_fluttter_study/domains/doit/domain/model/entities/entities.dart';

/// 연예인 정보와 관련하여 서버와 통신하는 Repository layer입니다.
abstract class CelebrityRepository {
  /// 패칭된 연예인 정보를 Listen 할 수 있습니다.
  ///
  /// Write는 할 수 없습니다.
  Stream<Iterable<Celebrity>> get celebrityIterableStream;

  /// 연예인 정보를 패칭합니다.
  ///
  /// 호출한 시점의 연예인 정보를 받아올 수 있습니다. 이전 정보는 받아올 수 없습니다.
  Future<Iterable<Celebrity>> getCelebrity();
}
