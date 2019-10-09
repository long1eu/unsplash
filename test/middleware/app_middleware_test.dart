// File created by
// Lung Razvan <long1eu>
// on 09/10/2019

import 'dart:convert';

import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:test/test.dart';
import 'package:unsplash/actions/actions.dart';
import 'package:unsplash/data/unsplash_api.dart';
import 'package:unsplash/middleware/app_middleware.dart';
import 'package:unsplash/models/app_state.dart';
import 'package:unsplash/models/unsplash_image.dart';

import '../res/res.dart';

void main() {
  test('searchPhotos', () async {
    const String query = 'query';
    final String data = Res.randomPhotoCount_3.readAsStringSync();
    final List<UnsplashImage> images = List<dynamic>.from(jsonDecode(data))
        .map((dynamic it) => UnsplashImage.fromJson(it))
        .toList();

    final MockUnsplashApi api = MockUnsplashApi();
    when(api.searchPhotos(captureThat(anything)))
        .thenAnswer((_) async => images);

    final MockStore store = MockStore();
    when(store.dispatch(captureThat(anything)));
    final AppMiddleware middleware = AppMiddleware(api);
    const SearchPhotos action = SearchPhotos(query);

    final List<dynamic> args = <dynamic>[];
    void next(dynamic action) => args.add(action);

    final Future<void> future = middleware.searchPhotos(store, action, next);
    expect(args[0], action);
    await future;

    final VerificationResult verifyResult =
        verify(store.dispatch(captureThat(anything)));
    expect(verifyResult.callCount, 1);
    expect(verifyResult.captured.length, 1);
    expect(verifyResult.captured[0], isA<SetImages>());
    expect(verifyResult.captured[0].images, images);
  });
}

class MockUnsplashApi extends Mock implements UnsplashApi {}

class MockStore extends Mock implements Store<AppState> {}
