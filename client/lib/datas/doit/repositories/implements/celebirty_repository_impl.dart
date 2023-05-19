import 'dart:async';

import 'package:doit_fluttter_study/datas/doit/repositories/interfaces/celebrity_repository.dart';
import 'package:doit_fluttter_study/domains/core/http/clients/clients.dart';
import 'package:doit_fluttter_study/domains/doit/domain/model/entities/celebrity.dart';
import 'package:doit_fluttter_study/domains/doit/domain/model/mappers/celebrity_mapper.dart';

/// 연예인 정보와 관련하여 서버와 통신하는 CelebrityRepository의 구현체입니다.
///
/// [celebrityIterableStream]를 담당하는 [_celebrityIterableStreamController]는 broadcast로 만들어, 여러 개의 listen이 만들어질 수 있도록 했습니다. broadcast 옵션이 없으면 listen은 1명만 할 수 있습니다.
class CelebrityRepositoryImpl implements CelebrityRepository {
  final DoitRestClient _doitRestClient;
  final StreamController<Iterable<Celebrity>>
      _celebrityIterableStreamController = StreamController.broadcast();

  CelebrityRepositoryImpl({required DoitRestClient doitRestClient})
      : _doitRestClient = doitRestClient;

  @override
  Stream<Iterable<Celebrity>> get celebrityIterableStream =>
      _celebrityIterableStreamController.stream;

  /// 서버로부터 연예인 정보를 받아온 뒤, [celebrityIterableStream]에 해당 데이터를 추가합니다.
  @override
  Future<Iterable<Celebrity>> getCelebrity() async {
    final response = await _doitRestClient.getCelebrities();
    final result = response.map((e) => CelebrityMapper.dtoToEntity(e));

    _celebrityIterableStreamController.sink.add(result);
    return result;
  }
}
