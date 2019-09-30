// File created by
// Lung Razvan <long1eu>
// on 30/09/2019

import 'package:http/http.dart';
import 'package:test/test.dart';
import 'package:unsplash/services/http_service.dart';
import 'package:mockito/mockito.dart';

void main() {
  const String baseUrl = 'http://example.com';
  final Client client = Client();

  test('constructor', () {
    final HttpService service = HttpService(baseUrl, client);

    expect(service.baseUrl, baseUrl);
    expect(service.client, client);
  });

  group('get', () {
    const String path = '/path';
    const String url = '$baseUrl$path';
    const Map<String, String> headers = <String, String>{
      'key1': 'value1',
      'key2': 'value2',
    };
    final Client client = MockClient();

    test('get 200', () async {
      when(client.get(anything, headers: anyNamed('headers')))
          .thenAnswer((_) async => Response('{"message":"test"}', 200));

      final HttpService service = HttpService(baseUrl, client);

      final dynamic result = await service.get(path, headers: headers);
      expect(result, <String, dynamic>{'message': 'test'});

      final VerificationResult verificationResult = verify(client
          .get(captureThat(anything), headers: captureAnyNamed('headers')));
      verificationResult.called(1);

      final List<dynamic> captured = verificationResult.captured;
      expect(captured.length, 2);
      expect(captured[0], url);
      expect(captured[1], headers);
    });

    test('get 400', () async {
      const String errorMessage = '{"error":"message"}';
      const int errorStatusCode = 400;

      when(client.get(anything, headers: anyNamed('headers')))
          .thenAnswer((_) async => Response(errorMessage, errorStatusCode));

      final HttpService service = HttpService(baseUrl, client);

      expect(() => service.get(path, headers: headers), throwsA(errorMessage));
    });
  });
}

class MockClient extends Mock implements Client {}
