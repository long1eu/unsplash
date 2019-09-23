// File created by
// Lung Razvan <long1eu>
// on 16/09/2019

library app_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:unsplash/models/unsplash_image.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState([void updates(AppStateBuilder b)]) = _$AppState;

  factory AppState.initialState() {
    return _$AppState((AppStateBuilder b) {
      b
        ..images = ListBuilder<UnsplashImage>()
        ..isLoading = false;
    });
  }

  AppState._();

  BuiltList<UnsplashImage> get images;

  bool get isLoading;
}
