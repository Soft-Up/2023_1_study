import 'dart:async';
import 'dart:developer';

import 'package:doit_fluttter_study/datas/doit/clients/clients.dart';
import 'package:doit_fluttter_study/datas/doit/repositories/interfaces/celebrity_repository.dart';
import 'package:doit_fluttter_study/domains/doit/domain/model/entities/celebrity.dart';
import 'package:doit_fluttter_study/domains/doit/domain/model/mappers/celebrity_mapper.dart';

class CelebrityRepositoryImpl implements CelebrityRepository {
  final CelebrityClient _celebrityClient;
  final StreamController<Iterable<Celebrity>>
      _celebrityIterableStreamController = StreamController.broadcast();

  CelebrityRepositoryImpl({required CelebrityClient celebrityClient})
      : _celebrityClient = celebrityClient;

  @override
  Stream<Iterable<Celebrity>> get celebrityIterableStream =>
      _celebrityIterableStreamController.stream;

  @override
  Future<Iterable<Celebrity>> getCelebrity() async {
    final response = await _celebrityClient.getCelebrity();
    final result = response.map((e) => CelebrityMapper.dtoToEntity(e));

    _celebrityIterableStreamController.sink.add(result);
    return result;
  }
}
