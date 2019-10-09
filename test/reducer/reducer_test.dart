// File created by
// Lung Razvan <long1eu>
// on 09/10/2019

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:test/test.dart';
import 'package:unsplash/actions/actions.dart';
import 'package:unsplash/models/app_state.dart';
import 'package:unsplash/models/unsplash_image.dart';
import 'package:unsplash/reducers/reducer.dart';

import '../res/res.dart';

void main() {
  test('setImages', () {
    final AppState initial = AppState.initialState();
    expect(initial.images, isEmpty);
    expect(initial.isLoading, isFalse);

    final String data = Res.randomPhotoCount_3.readAsStringSync();
    final List<UnsplashImage> images = List<dynamic>.from(jsonDecode(data))
        .map((dynamic it) => UnsplashImage.fromJson(it))
        .toList();

    final SetImages action = SetImages(images);

    final AppState result = reducer(initial, action);
    expect(result.images, isNotEmpty);
    expect(result.images.toList(), action.images);
    expect(result.isLoading, isFalse);
  });

  test('searchPhotos', () {
    const String query = 'query';
    final String data = Res.randomPhotoCount_3.readAsStringSync();
    final List<UnsplashImage> images = List<dynamic>.from(jsonDecode(data))
        .map((dynamic it) => UnsplashImage.fromJson(it))
        .toList();
    AppState initial = AppState.initialState().rebuild(
        (AppStateBuilder b) => b.images = ListBuilder<UnsplashImage>(images));
    expect(initial.isLoading, isFalse);

    const SearchPhotos action = SearchPhotos(query);

    final AppState result = reducer(initial, action);
    expect(result.isLoading, isTrue);

    initial = initial.rebuild((AppStateBuilder b) => b.isLoading = true);
    expect(result, initial);
  });
}
