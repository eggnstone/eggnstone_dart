import 'dart:async';

// TODO: cater for void and int
class DartRunner
{
    static const String CLASS_NAME = 'DartRunner';

    final Future<int?> Function(List<String> args) mainOrThrow;
    final Future<int?> Function(Object error, StackTrace stackTrace)? onCatch;
    final Future<void> Function()? onFinally;
    final void Function(String message)? onLogDebug;
    final void Function(String source, Object error, StackTrace stackTrace)? onLogErrorObject;

    DartRunner({required this.mainOrThrow, this.onCatch, this.onFinally, this.onLogDebug, this.onLogErrorObject});

    Future<int?> run(List<String> args)
    async
    {
        const String METHOD_NAME = '$CLASS_NAME.runSafe';
        _logDebug('$METHOD_NAME START');

        bool encounteredErrorInRunZonedGuarded = false;
        int? exitCode;

        try
        {
            exitCode = await runZonedGuarded<Future<int?>>(()
                async
                {
                    _logDebug('$METHOD_NAME/runZonedGuarded START');
                    try
                    {
                        final int? exitCode = await mainOrThrow(args);
                        _logDebug('$METHOD_NAME/runZonedGuarded END with ExitCode: $exitCode');
                        return exitCode;
                    }
                    catch (e, stackTrace)
                    {
                        return onCatch?.call(e, stackTrace);
                    }
                    finally
                    {
                        await onFinally?.call();
                    }
                }, (Object e, StackTrace stackTrace)
                async
                {
                    exitCode = await onCatch?.call(e, stackTrace);
                    _logErrorObject('main/runZonedGuarded', e, stackTrace);
                    encounteredErrorInRunZonedGuarded = true;
                }
            );
        }
        catch (e, stackTrace)
        {
            exitCode = await onCatch?.call(e, stackTrace);
        }

        _logDebug('$METHOD_NAME END (ExitCode=$exitCode, EncounteredErrorInRunZonedGuarded=$encounteredErrorInRunZonedGuarded)');
        return exitCode;
    }

    void _logDebug(String message)
    => onLogDebug?.call(message);

    void _logErrorObject(String source, Object error, StackTrace stackTrace)
    => onLogErrorObject?.call(source, error, stackTrace);
}
