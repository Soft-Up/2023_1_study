import 'dart:async';

import 'package:doit_fluttter_study/datas/doit/repositories/repositories.dart';
import 'package:doit_fluttter_study/domains/doit/domain/model/entities/celebrity.dart';
import 'package:doit_fluttter_study/domains/doit/domain/services/services.dart';

class CelebrityServiceImpl implements CelebrityService {
  final CelebrityRepository _celebrityRepository;

  final StreamController<Iterable<Celebrity>>
      _celebrityIterableStreamController = StreamController();

  CelebrityServiceImpl({required CelebrityRepository celebrityRepository})
      : _celebrityRepository = celebrityRepository;

  @override
  // TODO: implement celebrityIterableStream
  Stream<Iterable<Celebrity>> get celebrityIterableStream =>
      _celebrityRepository.celebrityIterableStream;

  @override
  Future<Iterable<Celebrity>> getCelebrity() async {
    final result = await _celebrityRepository.getCelebrity();
    _celebrityIterableStreamController.add(result);
    return result;
  }
}
