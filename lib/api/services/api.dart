



import 'api_keys.dart';


enum Endpoint {
  cases,
  casesSuspected,
  casesConfirmed,
  deaths,
  recovered,
}






class API {
  API({required this.apiKey});

  final String apiKey;

  factory API.sandbox() => API(apiKey: APIKeys.liveApi);


  //static final String host = 'http://103.141.9.234/himsmobappapi/login';

  // Uri tokenUri() => Uri(
  //
  //   scheme: 'http',
  //   host: host,
  //   path: 'token',
  // );

  Uri tokenUri() => Uri.parse(API.sandbox().apiKey);


  static Map<Endpoint, String> _paths = {
    Endpoint.cases: 'cases',
    Endpoint.casesSuspected: 'casesSuspected',
    Endpoint.casesConfirmed: 'casesConfirmed',
    Endpoint.deaths: 'deaths',
    Endpoint.recovered: 'recovered',
  };




}