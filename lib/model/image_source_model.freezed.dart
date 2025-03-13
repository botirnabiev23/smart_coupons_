// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_source_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ImageSourceModel _$ImageSourceModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'local':
      return LocalImageSourceModel.fromJson(json);
    case 'network':
      return NetworkImageSourceModel.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ImageSourceModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ImageSourceModel {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path) local,
    required TResult Function(String url) network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path)? local,
    TResult? Function(String url)? network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path)? local,
    TResult Function(String url)? network,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocalImageSourceModel value) local,
    required TResult Function(NetworkImageSourceModel value) network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocalImageSourceModel value)? local,
    TResult? Function(NetworkImageSourceModel value)? network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocalImageSourceModel value)? local,
    TResult Function(NetworkImageSourceModel value)? network,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this ImageSourceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageSourceModelCopyWith<$Res> {
  factory $ImageSourceModelCopyWith(
          ImageSourceModel value, $Res Function(ImageSourceModel) then) =
      _$ImageSourceModelCopyWithImpl<$Res, ImageSourceModel>;
}

/// @nodoc
class _$ImageSourceModelCopyWithImpl<$Res, $Val extends ImageSourceModel>
    implements $ImageSourceModelCopyWith<$Res> {
  _$ImageSourceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImageSourceModel
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LocalImageSourceModelImplCopyWith<$Res> {
  factory _$$LocalImageSourceModelImplCopyWith(
          _$LocalImageSourceModelImpl value,
          $Res Function(_$LocalImageSourceModelImpl) then) =
      __$$LocalImageSourceModelImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$$LocalImageSourceModelImplCopyWithImpl<$Res>
    extends _$ImageSourceModelCopyWithImpl<$Res, _$LocalImageSourceModelImpl>
    implements _$$LocalImageSourceModelImplCopyWith<$Res> {
  __$$LocalImageSourceModelImplCopyWithImpl(_$LocalImageSourceModelImpl _value,
      $Res Function(_$LocalImageSourceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImageSourceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_$LocalImageSourceModelImpl(
      null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalImageSourceModelImpl implements LocalImageSourceModel {
  const _$LocalImageSourceModelImpl(this.path, {final String? $type})
      : $type = $type ?? 'local';

  factory _$LocalImageSourceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalImageSourceModelImplFromJson(json);

  @override
  final String path;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ImageSourceModel.local(path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalImageSourceModelImpl &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, path);

  /// Create a copy of ImageSourceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalImageSourceModelImplCopyWith<_$LocalImageSourceModelImpl>
      get copyWith => __$$LocalImageSourceModelImplCopyWithImpl<
          _$LocalImageSourceModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path) local,
    required TResult Function(String url) network,
  }) {
    return local(path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path)? local,
    TResult? Function(String url)? network,
  }) {
    return local?.call(path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path)? local,
    TResult Function(String url)? network,
    required TResult orElse(),
  }) {
    if (local != null) {
      return local(path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocalImageSourceModel value) local,
    required TResult Function(NetworkImageSourceModel value) network,
  }) {
    return local(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocalImageSourceModel value)? local,
    TResult? Function(NetworkImageSourceModel value)? network,
  }) {
    return local?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocalImageSourceModel value)? local,
    TResult Function(NetworkImageSourceModel value)? network,
    required TResult orElse(),
  }) {
    if (local != null) {
      return local(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalImageSourceModelImplToJson(
      this,
    );
  }
}

abstract class LocalImageSourceModel implements ImageSourceModel {
  const factory LocalImageSourceModel(final String path) =
      _$LocalImageSourceModelImpl;

  factory LocalImageSourceModel.fromJson(Map<String, dynamic> json) =
      _$LocalImageSourceModelImpl.fromJson;

  String get path;

  /// Create a copy of ImageSourceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalImageSourceModelImplCopyWith<_$LocalImageSourceModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkImageSourceModelImplCopyWith<$Res> {
  factory _$$NetworkImageSourceModelImplCopyWith(
          _$NetworkImageSourceModelImpl value,
          $Res Function(_$NetworkImageSourceModelImpl) then) =
      __$$NetworkImageSourceModelImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$NetworkImageSourceModelImplCopyWithImpl<$Res>
    extends _$ImageSourceModelCopyWithImpl<$Res, _$NetworkImageSourceModelImpl>
    implements _$$NetworkImageSourceModelImplCopyWith<$Res> {
  __$$NetworkImageSourceModelImplCopyWithImpl(
      _$NetworkImageSourceModelImpl _value,
      $Res Function(_$NetworkImageSourceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImageSourceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$NetworkImageSourceModelImpl(
      null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NetworkImageSourceModelImpl implements NetworkImageSourceModel {
  const _$NetworkImageSourceModelImpl(this.url, {final String? $type})
      : $type = $type ?? 'network';

  factory _$NetworkImageSourceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NetworkImageSourceModelImplFromJson(json);

  @override
  final String url;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ImageSourceModel.network(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkImageSourceModelImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  /// Create a copy of ImageSourceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkImageSourceModelImplCopyWith<_$NetworkImageSourceModelImpl>
      get copyWith => __$$NetworkImageSourceModelImplCopyWithImpl<
          _$NetworkImageSourceModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path) local,
    required TResult Function(String url) network,
  }) {
    return network(url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path)? local,
    TResult? Function(String url)? network,
  }) {
    return network?.call(url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path)? local,
    TResult Function(String url)? network,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocalImageSourceModel value) local,
    required TResult Function(NetworkImageSourceModel value) network,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocalImageSourceModel value)? local,
    TResult? Function(NetworkImageSourceModel value)? network,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocalImageSourceModel value)? local,
    TResult Function(NetworkImageSourceModel value)? network,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NetworkImageSourceModelImplToJson(
      this,
    );
  }
}

abstract class NetworkImageSourceModel implements ImageSourceModel {
  const factory NetworkImageSourceModel(final String url) =
      _$NetworkImageSourceModelImpl;

  factory NetworkImageSourceModel.fromJson(Map<String, dynamic> json) =
      _$NetworkImageSourceModelImpl.fromJson;

  String get url;

  /// Create a copy of ImageSourceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkImageSourceModelImplCopyWith<_$NetworkImageSourceModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
