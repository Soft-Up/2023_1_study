import 'package:doit_fluttter_study/domains/doit/domain/model/dtos/dtos.dart';
import 'package:doit_fluttter_study/domains/doit/domain/model/entities/entities.dart';

class CelebrityMapper {
  static Celebrity dtoToEntity(CelebrityDto celebrityDto) {
    return Celebrity(
        name: celebrityDto.name,
        type: celebrityDto.type,
        gender: celebrityDto.gender,
        imgUrl: celebrityDto.imgUrl);
  }
}
