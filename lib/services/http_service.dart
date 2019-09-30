// File created by
// Lung Razvan <long1eu>
// on 23/09/2019
import 'dart:convert';

import 'package:http/http.dart';

class HttpService {
  HttpService(this.baseUrl, [Client client]) : client = client ?? Client();

  final String baseUrl;
  final Client client;

  Future<dynamic> get(String path, {Map<String, String> headers}) async {
    print('GET: $path $headers');
    final Response response =
        await client.get('$baseUrl$path', headers: headers);

    if (response.statusCode >= 400) {
      return Future<String>.error(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }
}
