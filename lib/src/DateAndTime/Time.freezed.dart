// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Time.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Time {
  int get hours;
  int get minutes;
  int get seconds;

  /// Create a copy of Time
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TimeCopyWith<Time> get copyWith =>
      _$TimeCopyWithImpl<Time>(this as Time, _$identity);

  /// Serializes this Time to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Time &&
            (identical(other.hours, hours) || other.hours == hours) &&
            (identical(other.minutes, minutes) || other.minutes == minutes) &&
            (identical(other.seconds, seconds) || other.seconds == seconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hours, minutes, seconds);
}

/// @nodoc
abstract mixin class $TimeCopyWith<$Res> {
  factory $TimeCopyWith(Time value, $Res Function(Time) _then) =
      _$TimeCopyWithImpl;
  @useResult
  $Res call({int hours, int minutes, int seconds});
}

/// @nodoc
class _$TimeCopyWithImpl<$Res> implements $TimeCopyWith<$Res> {
  _$TimeCopyWithImpl(this._self, this._then);

  final Time _self;
  final $Res Function(Time) _then;

  /// Create a copy of Time
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hours = null,
    Object? minutes = null,
    Object? seconds = null,
  }) {
    return _then(_self.copyWith(
      hours: null == hours
          ? _self.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as int,
      minutes: null == minutes
          ? _self.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
      seconds: null == seconds
          ? _self.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _Time extends Time {
  const _Time({required this.hours, required this.minutes, this.seconds = 0})
      : super._();
  factory _Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);

  @override
  final int hours;
  @override
  final int minutes;
  @override
  @JsonKey()
  final int seconds;

  /// Create a copy of Time
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TimeCopyWith<_Time> get copyWith =>
      __$TimeCopyWithImpl<_Time>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TimeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Time &&
            (identical(other.hours, hours) || other.hours == hours) &&
            (identical(other.minutes, minutes) || other.minutes == minutes) &&
            (identical(other.seconds, seconds) || other.seconds == seconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hours, minutes, seconds);
}

/// @nodoc
abstract mixin class _$TimeCopyWith<$Res> implements $TimeCopyWith<$Res> {
  factory _$TimeCopyWith(_Time value, $Res Function(_Time) _then) =
      __$TimeCopyWithImpl;
  @override
  @useResult
  $Res call({int hours, int minutes, int seconds});
}

/// @nodoc
class __$TimeCopyWithImpl<$Res> implements _$TimeCopyWith<$Res> {
  __$TimeCopyWithImpl(this._self, this._then);

  final _Time _self;
  final $Res Function(_Time) _then;

  /// Create a copy of Time
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? hours = null,
    Object? minutes = null,
    Object? seconds = null,
  }) {
    return _then(_Time(
      hours: null == hours
          ? _self.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as int,
      minutes: null == minutes
          ? _self.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
      seconds: null == seconds
          ? _self.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
