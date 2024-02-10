import 'package:eggnstone_dart/src/DartRunner.dart';
import 'package:test/test.dart';

void main()
{
    test('ThrowSync', () async
        {
            const bool expectedOnExceptionCalled = true;
            const bool expectedOnFinallyCalled = true;
            const bool expectedOnLogErrorObjectCalled = true;
            const int? expectedExitCode = null;

            bool actualExceptionCalled = true;
            bool actualFinallyCalled = true;
            bool actualLogErrorObjectCalled = true;

            final DartRunner runner = DartRunner(
                mainOrThrow: mainOrThrow,
                onCatch: (Object error, StackTrace stackTrace) async
                {
                    actualExceptionCalled = true;
                    return null;
                }
                ,
                onFinally: () async => actualFinallyCalled = true,
                onLogErrorObject: (String source, Object error, StackTrace stackTrace) async => actualLogErrorObjectCalled = true
            );

            final int? actualExitCode = await runner.run(<String>[]);

            expect(actualExceptionCalled, equals(expectedOnExceptionCalled));
            expect(actualFinallyCalled, equals(expectedOnFinallyCalled));
            expect(actualLogErrorObjectCalled, equals(expectedOnLogErrorObjectCalled));

            expect(actualExitCode, equals(expectedExitCode));
        }
    );
}

Future<int> mainOrThrow(List<String> args)
async => throw Exception('TEST');
