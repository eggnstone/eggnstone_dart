import 'dart:async';

import 'package:eggnstone_dart/eggnstone_dart.dart';
import 'package:test/test.dart';

const String TIME_REGEX = r'\d{2}:\d{2}:\d{2}';

void main()
{
    setUp(()
        {
            useNewLogger = false;
        }
    );

    testLogDebug();
    testLogInfo();
    testLogWarning();
    testLogError();
}

void testLogDebug()
{
    group('logDebug', ()
        {
            final List<String> loggerNotEnabledLog = <String>[];
            test('Logger not enabled => no log', ()
                =>
                overridePrint(loggerNotEnabledLog, ()
                    {
                        isLoggerEnabled = false;
                        logDebug('Test');
                        expect(loggerNotEnabledLog.length, 0);
                    }
                ));

            final List<String> loggerEnabledLog = <String>[];
            test('Logger enabled => log', ()
                =>
                overridePrint(loggerEnabledLog, ()
                    {
                        isLoggerEnabled = true;
                        logDebug('Test');
                        expect(loggerEnabledLog.length, 1);
                    }
                ));

            final List<String> log = <String>[];
            test('Prefixes text with time and type annotation', ()
                =>
                overridePrint(log, ()
                    {
                        const String MESSAGE = 'TestDebug';
                        const String ANNOTATED_MESSAGE = 'Debug: $MESSAGE';

                        isLoggerEnabled = true;
                        logDebug(MESSAGE);
                        expect(RegExp('^$TIME_REGEX $ANNOTATED_MESSAGE' r'$').hasMatch(log[0]), isTrue);
                    }
                ));
        }
    );
}

void testLogInfo()
{
    group('logInfo', ()
        {
            final List<String> loggerNotEnabledLog = <String>[];
            test('Logger not enabled => no log', ()
                =>
                overridePrint(loggerNotEnabledLog, ()
                    {
                        isLoggerEnabled = false;
                        logInfo('Test');
                        expect(loggerNotEnabledLog.length, 0);
                    }
                ));

            final List<String> loggerEnabledLog = <String>[];
            test('Logger enabled => log', ()
                =>
                overridePrint(loggerEnabledLog, ()
                    {
                        isLoggerEnabled = true;
                        logInfo('Test');
                        expect(loggerEnabledLog.length, 1);
                    }
                ));

            final List<String> log = <String>[];
            test('Prefixes text with time and type annotation', ()
                =>
                overridePrint(log, ()
                    {
                        const String MESSAGE = 'TestInfo';
                        const String ANNOTATED_MESSAGE = 'Info:  $MESSAGE';

                        isLoggerEnabled = true;
                        logInfo(MESSAGE);
                        expect(RegExp('^$TIME_REGEX $ANNOTATED_MESSAGE' r'$').hasMatch(log[0]), isTrue);
                    }
                ));
        }
    );
}

void testLogWarning()
{
    group('logWarning', ()
        {
            final List<String> loggerNotEnabledLog = <String>[];
            test('Logger not enabled => no log', ()
                =>
                overridePrint(loggerNotEnabledLog, ()
                    {
                        isLoggerEnabled = false;
                        logWarning('Test');
                        expect(loggerNotEnabledLog.length, 0);
                    }
                ));

            final List<String> loggerEnabledLog = <String>[];
            test('Logger enabled => log', ()
                =>
                overridePrint(loggerEnabledLog, ()
                    {
                        isLoggerEnabled = true;
                        logWarning('Test');
                        expect(loggerEnabledLog.length, 1);
                    }
                ));

            final List<String> log = <String>[];
            test('Prefixes text with time and type annotation', ()
                =>
                overridePrint(log, ()
                    {
                        const String MESSAGE = 'TestWarning';
                        const String ANNOTATED_MESSAGE = 'Warn:  $MESSAGE';

                        isLoggerEnabled = true;
                        logWarning(MESSAGE);
                        expect(RegExp('^$TIME_REGEX $ANNOTATED_MESSAGE' r'$').hasMatch(log[0]), isTrue);
                    }
                ));
        }
    );
}

// TODO: tests for error and stackTrace
void testLogError()
{
    group('logError', ()
        {
            final List<String> loggerNotEnabledLog = <String>[];
            test('Logger not enabled => no log', ()
                =>
                overridePrint(loggerNotEnabledLog, ()
                    {
                        isLoggerEnabled = false;
                        logError('Test');
                        expect(loggerNotEnabledLog.length, 0);
                    }
                ));

            final List<String> loggerEnabledLog = <String>[];
            test('Logger enabled => log', ()
                =>
                overridePrint(loggerEnabledLog, ()
                    {
                        isLoggerEnabled = true;
                        logError('Test');
                        expect(loggerEnabledLog.length, 1);
                    }
                ));

            final List<String> log = <String>[];
            test('Prefixes text with time and type annotation', ()
                =>
                overridePrint(log, ()
                    {
                        const String MESSAGE = 'TestError';
                        const String ANNOTATED_MESSAGE = 'Error: $MESSAGE';

                        isLoggerEnabled = true;
                        logError(MESSAGE);
                        expect(RegExp('^$TIME_REGEX $ANNOTATED_MESSAGE' r'$').hasMatch(log[0]), isTrue, reason: '"${log[0]}" did not match expected format.');
                    }
                ));
        }
    );
}

dynamic overridePrint(List<String> log, dynamic Function() testFunction)
// ignore: prefer_expression_function_bodies
{
    return ()
    {
        final ZoneSpecification specification = ZoneSpecification(
            print: (_, __, ___, String msg)
            {
                // Add to log instead of printing to stdout
                log.add(msg);
            }
        );

        return Zone.current.fork(specification: specification).run<void>(testFunction);
    }
    ;
}
