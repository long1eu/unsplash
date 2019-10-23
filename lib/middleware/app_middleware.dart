// File created by
// Lung Razvan <long1eu>
// on 23/09/2019

import 'package:redux/redux.dart';
import 'package:unsplash/actions/actions.dart';
import 'package:unsplash/data/unsplash_api.dart';
import 'package:unsplash/models/app_state.dart';
import 'package:unsplash/models/unsplash_image.dart';

class AppMiddleware {
  const AppMiddleware(this._unsplashApi);

  final UnsplashApi _unsplashApi;

  List<Middleware<AppState>> get items {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, SearchPhotos>(searchPhotos),
      TypedMiddleware<AppState, GetRandomPhotos>(getRandomPhotos),
    ];
  }

  Future<void> searchPhotos(
      Store<AppState> store, SearchPhotos action, NextDispatcher next) async {
    next(action);
    final List<UnsplashImage> result =
        await _unsplashApi.searchPhotos(action.query);
    store.dispatch(SetImages(result));
  }

  Future<void> getRandomPhotos(Store<AppState> store, GetRandomPhotos action,
      NextDispatcher next) async {
    next(action);

    final List<UnsplashImage> result =
        await _unsplashApi.randomPhoto(action.count);
    store.dispatch(SetImages(result));
  }
}
