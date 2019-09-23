// File created by
// Lung Razvan <long1eu>
// on 23/09/2019

import 'package:unsplash/models/unsplash_image.dart';
import 'package:unsplash/services/http_service.dart';

class UnsplashApi {
  const UnsplashApi(this.http, this.accessToken);

  final HttpService http;
  final String accessToken;

  Map<String, String> get authHeaders {
    return <String, String>{
      'Authorization': 'Client-ID $accessToken',
    };
  }

  Future<List<UnsplashImage>> searchPhotos(String query) async {
    final dynamic data = await http.get(
      '/search/photos?query=${Uri.encodeQueryComponent(query)}',
      headers: authHeaders,
    );
    return List<dynamic>.from(data['results'])
        .map((dynamic it) => UnsplashImage.fromJson(it))
        .toList();
  }

  Future<UnsplashImage> randomPhoto(int count) async {
    final dynamic data =
        await http.get('/photos/random?count=$count', headers: authHeaders);
    return UnsplashImage.fromJson(data);
  }
}
