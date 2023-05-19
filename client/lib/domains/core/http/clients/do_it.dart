import 'package:retrofit/http.dart';

part 'do_it.g.dart';

@RestApi(baseUrl: "http://localhost:3000")
abstract class DoitRestClient {
  factory DoitRestClient(Dio dio, {String baseUri}) = _DoitRestClient;
}