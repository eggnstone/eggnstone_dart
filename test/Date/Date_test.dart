import 'package:eggnstone_dart/src/DateAndTime/Date.dart';
import 'package:test/test.dart';

void main()
{
    test('Date', () async
        {
            const Date date = Date(year: 2000, month: 12, day: 31);

            expect(date.year, equals(2000));
            expect(date.month, equals(12));
            expect(date.day, equals(31));
        }
    );

    test('Date.toJson', () async
        {
            const Date date = Date(year: 2000, month: 12, day: 31);

            final Map<String, dynamic> actual = date.toJson();

            expect(actual, equals(<String, int>{'Year': 2000, 'Month': 12, 'Day': 31}));
        }
    );

    test('Date.fromJson', () async
        {
            final Date date = Date.fromJson(<String, int>{'Year': 2000, 'Month': 12, 'Day': 31});

            expect(date.year, equals(2000));
            expect(date.month, equals(12));
            expect(date.day, equals(31));
        }
    );
}
