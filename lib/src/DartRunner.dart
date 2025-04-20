import 'dart:async';

// TODO: cater for void and int
/// A class to run a Dart function in a safe way, catching errors and allowing for custom error handling.
class DartRunner
{
    final Future<int?> Function(List<String> args) _mainOrThrow;
    final Future<int?> Function(Object error, StackTrace stackTrace)? _onCatch;
    final Future<void> Function()? _onFinally;
    final void Function(String message)? _onLogDebug;
    final void Function(String source, Object error, StackTrace stackTrace)? _onLogErrorObject;

    /// Constructor for [DartRunner].
    /// @param mainOrThrow The main function to run.
    /// @param onCatch Optional callback for handling errors.
    /// @param onFinally Optional callback to run after the main function.
    /// @param onLogDebug Optional callback for logging debug messages.
    /// @param onLogErrorObject Optional callback for logging error objects.
    DartRunner({required Future<int?> Function(List<String>) mainOrThrow, Future<int?> Function(Object, StackTrace)? onCatch, Future<void> Function()? onFinally, void Function(String)? onLogDebug, void Function(String, Object, StackTrace)? onLogErrorObject}) : _onLogErrorObject = onLogErrorObject, _onLogDebug = onLogDebug, _onFinally = onFinally, _onCatch = onCatch, _mainOrThrow = mainOrThrow;

    /// Runs the main function in a safe way, catching errors and allowing for custom error handling.
    /// @param args The arguments to pass to the main function.
    Future<int?> run(List<String> args)
    async
    {
        const String METHOD_NAME = 'DartRunner.runSafe';
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
                        final int? exitCode = await _mainOrThrow(args);
                        _logDebug('$METHOD_NAME/runZonedGuarded END with ExitCode: $exitCode');
                        return exitCode;
                    }
                    catch (e, stackTrace)
                    {
                        return _onCatch?.call(e, stackTrace);
                    }
                    finally
                    {
                        await _onFinally?.call();
                    }
                }, (Object e, StackTrace stackTrace)
                async
                {
                    exitCode = await _onCatch?.call(e, stackTrace);
                    _logErrorObject('main/runZonedGuarded', e, stackTrace);
                    encounteredErrorInRunZonedGuarded = true;
                }
            );
        }
        catch (e, stackTrace)
        {
            exitCode = await _onCatch?.call(e, stackTrace);
        }

        _logDebug('$METHOD_NAME END (ExitCode=$exitCode, EncounteredErrorInRunZonedGuarded=$encounteredErrorInRunZonedGuarded)');
        return exitCode;
    }

    void _logDebug(String message)
    => _onLogDebug?.call(message);

    void _logErrorObject(String source, Object error, StackTrace stackTrace)
    => _onLogErrorObject?.call(source, error, stackTrace);
}
