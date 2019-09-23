// File created by
// Lung Razvan <long1eu>
// on 16/09/2019

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:unsplash/models/app_state.dart';
import 'package:unsplash/models/unsplash_image.dart';

class ImagesContainer extends StatelessWidget {
  const ImagesContainer({Key key, this.builder}) : super(key: key);

  final ViewModelBuilder<List<UnsplashImage>> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<UnsplashImage>>(
      converter: (Store<AppState> store) => store.state.images.toList(),
      distinct: true,
      builder: builder,
    );
  }
}
