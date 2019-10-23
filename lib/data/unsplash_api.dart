// File created by
// Lung Razvan <long1eu>
// on 23/09/2019

import 'package:flutter/cupertino.dart';
import 'package:unsplash/models/unsplash_image.dart';
import 'package:unsplash/services/http_service.dart';

class UnsplashApi {
  const UnsplashApi(this._http, this._accessToken);

  final HttpService _http;
  final String _accessToken;

  @visibleForTesting
  Map<String, String> get authHeaders {
    return <String, String>{
      'Authorization': 'Client-ID $_accessToken',
    };
  }

  Future<List<UnsplashImage>> searchPhotos(String query) async {
    final dynamic data = await _http.get(
      '/search/photos?query=${Uri.encodeQueryComponent(query)}',
      headers: authHeaders,
    );

    return List<dynamic>.from(data['results'])
        .map((dynamic it) => UnsplashImage.fromJson(it))
        .toList();
  }

  Future<List<UnsplashImage>> randomPhoto(int count) async {
    final dynamic data =
        await _http.get('/photos/random?count=$count', headers: authHeaders);


    print(data);

    return List<dynamic>.from(data)
        .map((dynamic it) => UnsplashImage.fromJson(it))
        .toList();
  }
}
