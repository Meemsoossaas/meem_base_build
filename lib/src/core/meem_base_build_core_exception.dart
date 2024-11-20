part of 'core.dart';

/// {@template meem}
///
///
///
/// {@endtemplate}
@protected
abstract class MeeMBaseBuildCoreException<T, V extends Object> extends Equatable implements Object, Exception {
  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  final String message;

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  final ExceptionResult<T, V> result;

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
