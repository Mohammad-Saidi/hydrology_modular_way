import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api.dart';

class APIService {
  APIService(this.api);

  final API api;

  Future<String> getAccessToken(email, password) async {
    // final response = await http.post(
    //   api.tokenUri(),
    //   headers: {'Authorization' : 'Basic ${api.apiKey}'},
    // );

    final response = await http.post(
      api.tokenUri(),
      body: {
        'username': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final accessToken = data['authorization']['token'];
      if (accessToken != null) {
        return accessToken;
      }
    }

    print(
        'Request ${api.tokenUri()} failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');

    throw response;
  }

  Future<dynamic> getEndpointData(
      {required String accessToken, required Endpoint endpoint}) async {
    final uri = api.endpointUri(endpoint);
    final response = await http.post(
      uri,
      body: {'keyword': 'Bog', 'date': '12-02-2024'},
      headers: {'Authorization': 'Bearer $accessToken'},

    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      dynamic result = data['hr6'];
      return result;
    }

    print(
        'Request $uri failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');
    throw response;
  }

// Future<String> getEndpointData({required String accessToken}) async {
//   const url = 'http://103.141.9.234/himsmobappapi/api/v1/hidm/user/registration?api_key=121212';
//   Uri uri = Uri.parse(url);
//   final response = await http.post(uri, headers: {'Authorization': 'Bearer $accessToken'});
//
//   if (response.statusCode == 200) {
//     final data = json.decode(response.body);
//
//     final String result = data["message"][0]["email"];
//
//     return result;
//
//   }
//   print('Request $uri failed\nResponse: ${response.statusCode}  ${response.reasonPhrase}');
//   throw response;
// }
}
