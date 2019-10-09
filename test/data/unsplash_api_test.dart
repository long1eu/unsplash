// File created by
// Lung Razvan <long1eu>
// on 09/10/2019

import 'dart:convert';
import 'dart:io';

import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:unsplash/data/unsplash_api.dart';
import 'package:unsplash/models/unsplash_image.dart';
import 'package:unsplash/services/http_service.dart';

import '../res/res.dart';

void main() {
  const String accessToken = 'accessToken';
  const Map<String, String> headers = <String, String>{
    'Authorization': 'Client-ID $accessToken',
  };

  test('authHeaders', () {
    final MockHttpService httpService = MockHttpService();
    final UnsplashApi api = UnsplashApi(httpService, accessToken);

    expect(api.authHeaders, headers);
  });

  test('searchPhoto', () async {
    const String query = 'query';
    final MockHttpService service = MockHttpService();
    _setupService(service, Res.photoSearchGetResult);

    final UnsplashApi api = UnsplashApi(service, accessToken);
    final List<UnsplashImage> result = await api.searchPhotos(query);
    expect(result, isNotEmpty);
    expect(result.length, 10);

    final VerificationResult verifiedResult = verify(service
        .get(captureThat(anything), headers: captureAnyNamed('headers')));

    expect(verifiedResult.callCount, 1);
    expect(verifiedResult.captured.length, 2);
    expect(verifiedResult.captured[0], startsWith('/search/photos?query='));
    expect(verifiedResult.captured[0], endsWith(query));
    expect(verifiedResult.captured[1], headers);
  });

  group('randomPhoto', () {
    final MockHttpService service = MockHttpService();
    final UnsplashApi api = UnsplashApi(service, accessToken);

    test('count 1', () async {
      const int count = 1;
      _setupService(service, Res.randomPhotoCount_1);

      final List<UnsplashImage> result = await api.randomPhoto(count);
      _checkRandomPhotoResult(result, count, 'OzlczC-hna0');

      final VerificationResult verifiedResult = verify(service
          .get(captureThat(anything), headers: captureAnyNamed('headers')));

      _checkRandomPhotoCall(verifiedResult, count, headers);
    });

    test('count 3', () async {
      const int count = 3;
      _setupService(service, Res.randomPhotoCount_3);

      final List<UnsplashImage> result = await api.randomPhoto(count);
      _checkRandomPhotoResult(result, count, 'iPoUfQkVM4c');

      final VerificationResult verifiedResult = verify(service
          .get(captureThat(anything), headers: captureAnyNamed('headers')));

      _checkRandomPhotoCall(verifiedResult, count, headers);
    });
  });
}

void _checkRandomPhotoCall(
    VerificationResult verifiedResult, int count, Map<String, String> headers) {
  expect(verifiedResult.callCount, 1);
  expect(verifiedResult.captured.length, 2);
  expect(verifiedResult.captured[0], startsWith('/photos/random?count='));
  expect(verifiedResult.captured[0], endsWith('$count'));
  expect(verifiedResult.captured[1], headers);
}

void _setupService(MockHttpService service, File file) {
  final String data = file.readAsStringSync();
  when(service.get(captureThat(anything), headers: captureAnyNamed('headers')))
      .thenAnswer((_) async => jsonDecode(data));
}

void _checkRandomPhotoResult(List<UnsplashImage> result, int count, String id) {
  expect(result, isNotEmpty);
  expect(result.length, count);
  expect(result[0].id, id);
}

class MockHttpService extends Mock implements HttpService {}
