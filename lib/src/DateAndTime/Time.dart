import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:sprintf/sprintf.dart';

part 'Time.freezed.dart';
part 'Time.g.dart';

@freezed
abstract class Time with _$Time implements Comparable<Time>
{
    const Time._();

    // ignore: invalid_annotation_target
    @JsonSerializable(fieldRename: FieldRename.pascal)
    const factory Time({
        required int hours,
        required int minutes,
        @Default(0) int seconds
    }) = _Time;

    factory Time.fromJson(Map<String, dynamic> json)
    => _$TimeFromJson(json);

    factory Time.fromDateTime(DateTime d)
    => Time(hours: d.hour, minutes: d.minute, seconds: d.second); 

    factory Time.now()
    => Time.fromDateTime(DateTime.now());

    factory Time.fromTotalSeconds(int totalSeconds)
    => Time(hours: (totalSeconds / 3600).round(), minutes: (totalSeconds % 3600 / 60).round(), seconds: totalSeconds % 60);

    factory Time.fromString(String s)
    => Time(hours: int.parse(s.substring(0, 2)), minutes: int.parse(s.substring(2, 4)),seconds: int.parse(s.substring(4, 6)));

    @override
    String toString()
    => sprintf('%02i%02i%02i', <int>[hours, minutes, seconds]);

    @override
    int compareTo(Time other)
    {
        if (hours < other.hours)
            return -1;

        if (hours > other.hours)
            return 1;

        if (minutes < other.minutes)
            return -1;

        if (minutes > other.minutes)
            return 1;

        if (seconds < other.seconds)
            return -1;

        if (seconds > other.seconds)
            return 1;

        return 0;
    }

    DateTime toDateTime()
    => DateTime.utc(0, 0, 0, hours, minutes, seconds);

    int toTotalSeconds()
    => hours * 3600 + minutes * 60 + seconds;

    String to12HoursMinutesString()
    => DateFormat.jm('en_US').format(toDateTime());

    String to24HoursMinutesString()
    => DateFormat.jm('de').format(toDateTime());

    String to24HoursMinutesSecondsString()
    => DateFormat('HH:mm:ss').format(toDateTime());

    Time addSeconds(int i)
    {
        DateTime dt = toDateTime();
        dt = dt.add(Duration(seconds: i));

        return Time.fromDateTime(dt);
    }

    Time addMinutes(int i)
    {
        DateTime dt = toDateTime();
        dt = dt.add(Duration(minutes: i));

        return Time.fromDateTime(dt);
    }

    Time addHours(int i)
    {
        DateTime dt = toDateTime();
        dt = dt.add(Duration(hours: i));

        return Time.fromDateTime(dt);
    }
}
