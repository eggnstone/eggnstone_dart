// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Time _$TimeFromJson(Map<String, dynamic> json) => _Time(
      hours: (json['Hours'] as num).toInt(),
      minutes: (json['Minutes'] as num).toInt(),
      seconds: (json['Seconds'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$TimeToJson(_Time instance) => <String, dynamic>{
      'Hours': instance.hours,
      'Minutes': instance.minutes,
      'Seconds': instance.seconds,
    };
