import 'dart:developer' as developer;

import 'package:intl/intl.dart';

DateFormat _dateFormat = DateFormat('HH:mm:ss');

bool _isEnabled = true;
bool _isWeb = false;

void initLog({required bool enabled, required bool isWeb})
{
    _isEnabled = enabled;
    _isWeb = isWeb;
}

// ignore: avoid_positional_boolean_parameters
void enableLog(bool value)
=> _isEnabled = value;

void logDebug(String message)
=> _log('Debug', message);

void logInfo(String message)
=> _log('Info', message);

void logWarning(String message)
=> _log('Warn', message);

void logError(String message, [Object? error, StackTrace? stackTrace])
=> _log('Error', message, error, stackTrace);

void _log(String level, String message, [Object? error, StackTrace? stackTrace])
{
    if (!_isEnabled)
        return;

    if (_isWeb)
    {
        // ignore: avoid_print
        print('${_dateFormat.format(DateTime.now())} ${'$level:'.padRight(6)} $message');

        if (error != null)
        {
            // ignore: avoid_print
            print('         $error');
        }

        if (stackTrace != null)
        {
            // ignore: avoid_print
            print('         $stackTrace');
        }
    }
    else
    {
        developer.log(
            '${_dateFormat.format(DateTime.now())} $message',
            name: level.padRight(5),
            error: error,
            stackTrace: stackTrace
        );
    }
}
