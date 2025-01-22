import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sprintf/sprintf.dart';

part 'Date.freezed.dart';

@freezed
class Date with _$Date implements Comparable<Date>
{
    const Date._();

    // ignore: invalid_annotation_target
    @JsonSerializable(fieldRename: FieldRename.pascal)
    const factory Date({
        required int year,
        required int month,
        required int day
    }) = _Date;

    factory Date.fromJson(Map<String, dynamic> json)
    => _$DateFromJson(json);

    factory Date.fromDateTime(DateTime dt)
    => Date(year: dt.year, month: dt.month, day: dt.day);

    factory Date.today()
    => Date.fromDateTime(DateTime.now());

    factory Date.fromString(String s)
    => Date(year: int.parse(s.substring(0, 4)), month: int.parse(s.substring(4, 6)), day: int.parse(s.substring(6, 8)));

    /// zero-based weekday, week starts with Monday
    int get weekday
    {
        final DateTime dt = toUtcDateTime();

        // DateTime weekday definition:
        // In accordance with ISO 8601
        // a week starts with Monday, which has the value 1.
        final int zeroBasedWeekday = dt.weekday - 1;

        return zeroBasedWeekday;
    }

    @override
    String toString()
    => sprintf('%04i%02i%02i', <int>[year, month, day]);

    @override
    int compareTo(Date other)
    {
        if (year < other.year)
            return -1;

        if (year > other.year)
            return 1;

        if (month < other.month)
            return -1;

        if (month > other.month)
            return 1;

        if (day < other.day)
            return -1;

        if (day > other.day)
            return 1;

        return 0;
    }

    Date subtractDays(int i)
    {
        DateTime dt = toUtcDateTime();
        dt = dt.subtract(Duration(days: i));

        return Date.fromDateTime(dt);
    }

    Date addDays(int i)
    {
        DateTime dt = toUtcDateTime();
        dt = dt.add(Duration(days: i));

        return Date.fromDateTime(dt);
    }

    DateTime toUtcDateTime()
    => DateTime.utc(year, month, day);

    int differenceInDays(Date other)
    {
        // When dealing with dates or historic events prefer to use UTC DateTimes,
        // since they are unaffected by daylight-saving changes and are unaffected
        // by the local timezone.
        final Duration diff = toUtcDateTime().difference(other.toUtcDateTime());

        return diff.inDays;
    }
}
