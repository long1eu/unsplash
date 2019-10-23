// File created by
// Lung Razvan <long1eu>
// on 16/09/2019

import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';
import 'package:unsplash/actions/actions.dart';
import 'package:unsplash/models/app_state.dart';
import 'package:unsplash/models/unsplash_image.dart';

final Reducer<AppState> reducer = combineReducers<AppState>(<Reducer<AppState>>[
  TypedReducer<AppState, SetImages>(_setImages),
  TypedReducer<AppState, SearchPhotos>(_searchPhotos),
  TypedReducer<AppState, GetRandomPhotos>(_getRandomPhotos),
]);

AppState _setImages(AppState state, SetImages action) {
  return state.rebuild((AppStateBuilder b) {
    b
      ..images = ListBuilder<UnsplashImage>(action.images)
      ..isLoading = false;
  });
}

AppState _searchPhotos(AppState state, SearchPhotos action) {
  return state.rebuild((AppStateBuilder b) {
    b..isLoading = true;
  });
}

AppState _getRandomPhotos(AppState state, GetRandomPhotos action) {
  return state.rebuild((AppStateBuilder b) {
    b..isLoading = true;
  });
}
