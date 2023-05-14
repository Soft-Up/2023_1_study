import 'package:doit_fluttter_study/datas/doit/clients/clients.dart';
import 'package:doit_fluttter_study/datas/doit/repositories/interfaces/celebrity_repository.dart';
import 'package:doit_fluttter_study/domains/doit/domain/model/entities/celebrity.dart';
import 'package:doit_fluttter_study/domains/doit/domain/model/mappers/celebrity_mapper.dart';

class CelebrityRepositoryImpl implements CelebrityRepository {
  final CelebrityClient _celebrityClient;

  CelebrityRepositoryImpl({required CelebrityClient celebrityClient})
      : _celebrityClient = celebrityClient;

  @override
  Future<Iterable<Celebrity>> getCelebrity() async {
    final result = await _celebrityClient.getCelebrity();
    return result.map((e) => CelebrityMapper.dtoToEntity(e));
  }
}
