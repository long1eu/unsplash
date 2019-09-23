// File created by
// Lung Razvan <long1eu>
// on 23/09/2019

library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:unsplash/models/app_state.dart';
import 'package:unsplash/models/unsplash_image.dart';
import 'package:unsplash/models/user.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[
  AppState,
  User,
  UnsplashImage,
  UnsplashImageUrls,
])
Serializers serializers = (_$serializers.toBuilder() //

      ..addPlugin(StandardJsonPlugin()) //

    )
    .build();
