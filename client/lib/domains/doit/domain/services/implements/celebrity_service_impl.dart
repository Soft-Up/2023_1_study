import 'package:doit_fluttter_study/datas/doit/repositories/repositories.dart';
import 'package:doit_fluttter_study/domains/doit/domain/model/entities/celebrity.dart';
import 'package:doit_fluttter_study/domains/doit/domain/services/services.dart';

class CelebrityServiceImpl implements CelebrityService {
  final CelebrityRepository _celebrityRepository;

  CelebrityServiceImpl({required CelebrityRepository celebrityRepository})
      : _celebrityRepository = celebrityRepository;

  @override
  Future<Iterable<Celebrity>> getCelebrity() async =>
      await _celebrityRepository.getCelebrity();
}
