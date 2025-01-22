// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimeImpl _$$TimeImplFromJson(Map<String, dynamic> json) => _$TimeImpl(
      hours: (json['Hours'] as num).toInt(),
      minutes: (json['Minutes'] as num).toInt(),
      seconds: (json['Seconds'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$TimeImplToJson(_$TimeImpl instance) =>
    <String, dynamic>{
      'Hours': instance.hours,
      'Minutes': instance.minutes,
      'Seconds': instance.seconds,
    };
