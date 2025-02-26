// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Date _$DateFromJson(Map<String, dynamic> json) => _Date(
      year: (json['Year'] as num).toInt(),
      month: (json['Month'] as num).toInt(),
      day: (json['Day'] as num).toInt(),
    );

Map<String, dynamic> _$DateToJson(_Date instance) => <String, dynamic>{
      'Year': instance.year,
      'Month': instance.month,
      'Day': instance.day,
    };
