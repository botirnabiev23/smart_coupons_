// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_source_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocalImageSourceModelImpl _$$LocalImageSourceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LocalImageSourceModelImpl(
      json['path'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LocalImageSourceModelImplToJson(
        _$LocalImageSourceModelImpl instance) =>
    <String, dynamic>{
      'path': instance.path,
      'runtimeType': instance.$type,
    };

_$NetworkImageSourceModelImpl _$$NetworkImageSourceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NetworkImageSourceModelImpl(
      json['url'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NetworkImageSourceModelImplToJson(
        _$NetworkImageSourceModelImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'runtimeType': instance.$type,
    };
