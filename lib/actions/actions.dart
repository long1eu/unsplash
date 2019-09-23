// File created by
// Lung Razvan <long1eu>
// on 16/09/2019

import 'package:unsplash/models/unsplash_image.dart';

class SearchPhotos {
  const SearchPhotos(this.query);

  final String query;
}

class SetImages {
  const SetImages(this.images);

  final List<UnsplashImage> images;
}
