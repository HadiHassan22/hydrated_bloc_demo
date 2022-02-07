// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Stop _$$_StopFromJson(Map<String, dynamic> json) => _$_Stop(
      id: json['id'] as String,
      packages: (json['packages'] as List<dynamic>?)
              ?.map((e) => Package.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Package>[],
    );

Map<String, dynamic> _$$_StopToJson(_$_Stop instance) => <String, dynamic>{
      'id': instance.id,
      'packages': instance.packages,
    };

_$_Package _$$_PackageFromJson(Map<String, dynamic> json) => _$_Package(
      id: json['id'] as String,
    );

Map<String, dynamic> _$$_PackageToJson(_$_Package instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
