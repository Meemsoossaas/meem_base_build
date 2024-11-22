part of 'core.dart';

/// {@template meem_base_build_core_exception}
///
/// A class which serves a based for exceptions in this API
///
/// {@endtemplate}
@internal
abstract class MeeMBaseBuildCoreException<T, V extends Object> extends Equatable implements Object, Exception {
  /// {@template meem_base_build_core_exception_message}
  ///
  /// The message of the exception being placed.
  ///
  /// {@endtemplate}
  final String message;

  /// {@macro exception_result}
  final ExceptionResult<T, V> result;

  /// {@macro meem_base_build_core_exception}
  const MeeMBaseBuildCoreException([
    this.message = 'An exception (MeeMBaseBuildCoreException) has occurred',
    this.result,
  ]);

  @override
  List<Object?> get props => [
        message,
        result,
      ];
}
