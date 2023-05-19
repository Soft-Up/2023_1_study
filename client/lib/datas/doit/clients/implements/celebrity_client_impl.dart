import 'package:doit_fluttter_study/domains/core/http/clients/clients.dart';
import 'package:doit_fluttter_study/datas/doit/clients/interfaces/celebrity_client.dart';
import 'package:doit_fluttter_study/domains/doit/domain/model/dtos/celebrity_dto.dart';

class CelebrityClientImpl implements CelebrityClient {
  final DoitRestClient _doitRestClient;

  CelebrityClientImpl({required DoitRestClient doitRestClient})
      : _doitRestClient = doitRestClient;

  @override
  Future<Iterable<CelebrityDto>> getCelebrity() async {
    return await _doitRestClient.getCelebrities();
  }
}
