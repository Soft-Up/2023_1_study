import 'package:doit_fluttter_study/datas/doit/repositories/interfaces/celebrity_repository.dart';
import 'package:doit_fluttter_study/domains/core/http/clients/clients.dart';
import 'package:doit_fluttter_study/domains/doit/domain/model/entities/celebrity.dart';
import 'package:doit_fluttter_study/domains/doit/domain/model/mappers/celebrity_mapper.dart';

class CelebrityRepositoryImpl implements CelebrityRepository {
  final DoitRestClient _doitRestClient;

  CelebrityRepositoryImpl({required DoitRestClient doitRestClient})
      : _doitRestClient = doitRestClient;

  @override
  Future<Iterable<Celebrity>> getCelebrity() async {
    final result = await _doitRestClient.getCelebrities();
    return result.map((e) => CelebrityMapper.dtoToEntity(e));
  }
}
