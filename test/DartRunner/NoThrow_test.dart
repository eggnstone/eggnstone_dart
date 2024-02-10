import 'package:eggnstone_dart/src/DartRunner.dart';
import 'package:test/test.dart';

void main()
{
    test('NoThrow', () async
        {
            const int expectedExitCode = 0;

            final DartRunner runner = DartRunner(
                mainOrThrow: mainOrThrow
            );

            final int? actualExitCode = await runner.run(<String>[]);

            expect(actualExitCode, equals(expectedExitCode));
        }
    );
}

Future<int> mainOrThrow(List<String> args)
async => 0;
