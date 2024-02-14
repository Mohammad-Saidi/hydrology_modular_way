



import 'api_keys.dart';


enum Endpoint {
  cases,
  casesSuspected,
  casesConfirmed,
  deaths,
  recovered,
}






class API {
  API({required this.host});

  final String host;

  factory API.sandbox() => API(host: APIKeys.liveHost);
  factory API.production() => API(host: APIKeys.localHost);


  //static final String host = 'http://103.141.9.234/himsmobappapi/login';

  Uri tokenUri() {
    return Uri(

      scheme: 'http',
      host: host,
      path: '/himsmobappapi/api/v1/user/login',
      queryParameters: {
        'api_key': '121212',
      },
    );
  }

  //Uri tokenUri() => Uri.parse(API.sandbox().apiKey);


  static Map<Endpoint, String> _paths = {
    Endpoint.cases: 'cases',
    Endpoint.casesSuspected: 'casesSuspected',
    Endpoint.casesConfirmed: 'casesConfirmed',
    Endpoint.deaths: 'deaths',
    Endpoint.recovered: 'recovered',
  };




}