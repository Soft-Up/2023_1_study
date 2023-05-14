import 'dart:convert';

import 'package:doit_fluttter_study/domains/core/http/exception/exceptions.dart';
import 'package:http/http.dart' as http;

import 'package:doit_fluttter_study/datas/doit/clients/interfaces/celebrity_client.dart';
import 'package:doit_fluttter_study/domains/doit/domain/model/dtos/celebrity_dto.dart';

class CelebrityClientImpl implements CelebrityClient {
  @override
  Future<Iterable<CelebrityDto>> getCelebrity() async {
    final Uri url = Uri.http('localhost:3000', 'datas');
    final http.Response response = await http.get(url);

    if (response.statusCode < 300) {
      final decodedResponse =
          jsonDecode(response.body) as List;
      return decodedResponse.map((e) => CelebrityDto.fromJson(e));
    }
    if (response.statusCode < 500) {
      throw ClientException();
    }
    throw ServerException();
  }
}
