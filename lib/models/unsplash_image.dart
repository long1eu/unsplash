// File created by
// Lung Razvan <long1eu>
// on 23/09/2019

library unsplash_image;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:unsplash/models/serializers.dart';

part 'unsplash_image.g.dart';

abstract class UnsplashImage
    implements Built<UnsplashImage, UnsplashImageBuilder> {
  factory UnsplashImage([void Function(UnsplashImageBuilder b) updates]) =
      _$UnsplashImage;

  factory UnsplashImage.fromJson(Map<dynamic, dynamic> json) =>
      serializers.deserializeWith(serializer, json);

  UnsplashImage._();

  String get id;

  String get color;

  UnsplashImageUrls get urls;

  int get likes;

  Map<String, dynamic> get json => serializers.serializeWith(serializer, this);

  static Serializer<UnsplashImage> get serializer => _$unsplashImageSerializer;
}

abstract class UnsplashImageUrls
    implements Built<UnsplashImageUrls, UnsplashImageUrlsBuilder> {
  factory UnsplashImageUrls(
          [void Function(UnsplashImageUrlsBuilder b) updates]) =
      _$UnsplashImageUrls;

  factory UnsplashImageUrls.fromJson(Map<dynamic, dynamic> json) =>
      serializers.deserializeWith(serializer, json);

  UnsplashImageUrls._();

  String get raw;

  String get full;

  String get regular;

  String get small;

  String get thumb;

  Map<String, dynamic> get json => serializers.serializeWith(serializer, this);

  static Serializer<UnsplashImageUrls> get serializer =>
      _$unsplashImageUrlsSerializer;
}
