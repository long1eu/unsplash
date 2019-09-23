// GENERATED CODE - DO NOT MODIFY BY HAND

part of unsplash_image;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UnsplashImage> _$unsplashImageSerializer =
    new _$UnsplashImageSerializer();
Serializer<UnsplashImageUrls> _$unsplashImageUrlsSerializer =
    new _$UnsplashImageUrlsSerializer();

class _$UnsplashImageSerializer implements StructuredSerializer<UnsplashImage> {
  @override
  final Iterable<Type> types = const [UnsplashImage, _$UnsplashImage];
  @override
  final String wireName = 'UnsplashImage';

  @override
  Iterable<Object> serialize(Serializers serializers, UnsplashImage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'color',
      serializers.serialize(object.color,
          specifiedType: const FullType(String)),
      'urls',
      serializers.serialize(object.urls,
          specifiedType: const FullType(UnsplashImageUrls)),
      'likes',
      serializers.serialize(object.likes, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  UnsplashImage deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UnsplashImageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'urls':
          result.urls.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UnsplashImageUrls))
              as UnsplashImageUrls);
          break;
        case 'likes':
          result.likes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$UnsplashImageUrlsSerializer
    implements StructuredSerializer<UnsplashImageUrls> {
  @override
  final Iterable<Type> types = const [UnsplashImageUrls, _$UnsplashImageUrls];
  @override
  final String wireName = 'UnsplashImageUrls';

  @override
  Iterable<Object> serialize(Serializers serializers, UnsplashImageUrls object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'raw',
      serializers.serialize(object.raw, specifiedType: const FullType(String)),
      'full',
      serializers.serialize(object.full, specifiedType: const FullType(String)),
      'regular',
      serializers.serialize(object.regular,
          specifiedType: const FullType(String)),
      'small',
      serializers.serialize(object.small,
          specifiedType: const FullType(String)),
      'thumb',
      serializers.serialize(object.thumb,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  UnsplashImageUrls deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UnsplashImageUrlsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'raw':
          result.raw = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'full':
          result.full = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'regular':
          result.regular = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'small':
          result.small = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'thumb':
          result.thumb = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UnsplashImage extends UnsplashImage {
  @override
  final String id;
  @override
  final String color;
  @override
  final UnsplashImageUrls urls;
  @override
  final int likes;

  factory _$UnsplashImage([void Function(UnsplashImageBuilder) updates]) =>
      (new UnsplashImageBuilder()..update(updates)).build();

  _$UnsplashImage._({this.id, this.color, this.urls, this.likes}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('UnsplashImage', 'id');
    }
    if (color == null) {
      throw new BuiltValueNullFieldError('UnsplashImage', 'color');
    }
    if (urls == null) {
      throw new BuiltValueNullFieldError('UnsplashImage', 'urls');
    }
    if (likes == null) {
      throw new BuiltValueNullFieldError('UnsplashImage', 'likes');
    }
  }

  @override
  UnsplashImage rebuild(void Function(UnsplashImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnsplashImageBuilder toBuilder() => new UnsplashImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnsplashImage &&
        id == other.id &&
        color == other.color &&
        urls == other.urls &&
        likes == other.likes;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc($jc(0, id.hashCode), color.hashCode), urls.hashCode),
        likes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UnsplashImage')
          ..add('id', id)
          ..add('color', color)
          ..add('urls', urls)
          ..add('likes', likes))
        .toString();
  }
}

class UnsplashImageBuilder
    implements Builder<UnsplashImage, UnsplashImageBuilder> {
  _$UnsplashImage _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _color;
  String get color => _$this._color;
  set color(String color) => _$this._color = color;

  UnsplashImageUrlsBuilder _urls;
  UnsplashImageUrlsBuilder get urls =>
      _$this._urls ??= new UnsplashImageUrlsBuilder();
  set urls(UnsplashImageUrlsBuilder urls) => _$this._urls = urls;

  int _likes;
  int get likes => _$this._likes;
  set likes(int likes) => _$this._likes = likes;

  UnsplashImageBuilder();

  UnsplashImageBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _color = _$v.color;
      _urls = _$v.urls?.toBuilder();
      _likes = _$v.likes;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UnsplashImage other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UnsplashImage;
  }

  @override
  void update(void Function(UnsplashImageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UnsplashImage build() {
    _$UnsplashImage _$result;
    try {
      _$result = _$v ??
          new _$UnsplashImage._(
              id: id, color: color, urls: urls.build(), likes: likes);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'urls';
        urls.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UnsplashImage', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UnsplashImageUrls extends UnsplashImageUrls {
  @override
  final String raw;
  @override
  final String full;
  @override
  final String regular;
  @override
  final String small;
  @override
  final String thumb;

  factory _$UnsplashImageUrls(
          [void Function(UnsplashImageUrlsBuilder) updates]) =>
      (new UnsplashImageUrlsBuilder()..update(updates)).build();

  _$UnsplashImageUrls._(
      {this.raw, this.full, this.regular, this.small, this.thumb})
      : super._() {
    if (raw == null) {
      throw new BuiltValueNullFieldError('UnsplashImageUrls', 'raw');
    }
    if (full == null) {
      throw new BuiltValueNullFieldError('UnsplashImageUrls', 'full');
    }
    if (regular == null) {
      throw new BuiltValueNullFieldError('UnsplashImageUrls', 'regular');
    }
    if (small == null) {
      throw new BuiltValueNullFieldError('UnsplashImageUrls', 'small');
    }
    if (thumb == null) {
      throw new BuiltValueNullFieldError('UnsplashImageUrls', 'thumb');
    }
  }

  @override
  UnsplashImageUrls rebuild(void Function(UnsplashImageUrlsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnsplashImageUrlsBuilder toBuilder() =>
      new UnsplashImageUrlsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnsplashImageUrls &&
        raw == other.raw &&
        full == other.full &&
        regular == other.regular &&
        small == other.small &&
        thumb == other.thumb;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, raw.hashCode), full.hashCode), regular.hashCode),
            small.hashCode),
        thumb.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UnsplashImageUrls')
          ..add('raw', raw)
          ..add('full', full)
          ..add('regular', regular)
          ..add('small', small)
          ..add('thumb', thumb))
        .toString();
  }
}

class UnsplashImageUrlsBuilder
    implements Builder<UnsplashImageUrls, UnsplashImageUrlsBuilder> {
  _$UnsplashImageUrls _$v;

  String _raw;
  String get raw => _$this._raw;
  set raw(String raw) => _$this._raw = raw;

  String _full;
  String get full => _$this._full;
  set full(String full) => _$this._full = full;

  String _regular;
  String get regular => _$this._regular;
  set regular(String regular) => _$this._regular = regular;

  String _small;
  String get small => _$this._small;
  set small(String small) => _$this._small = small;

  String _thumb;
  String get thumb => _$this._thumb;
  set thumb(String thumb) => _$this._thumb = thumb;

  UnsplashImageUrlsBuilder();

  UnsplashImageUrlsBuilder get _$this {
    if (_$v != null) {
      _raw = _$v.raw;
      _full = _$v.full;
      _regular = _$v.regular;
      _small = _$v.small;
      _thumb = _$v.thumb;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UnsplashImageUrls other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UnsplashImageUrls;
  }

  @override
  void update(void Function(UnsplashImageUrlsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UnsplashImageUrls build() {
    final _$result = _$v ??
        new _$UnsplashImageUrls._(
            raw: raw, full: full, regular: regular, small: small, thumb: thumb);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
