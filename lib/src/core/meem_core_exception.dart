part of 'core.dart';

/// {@template meem_core_exception}
///
/// A mock exception class of [MeeMCoreEvent] in 'meem_base'.
///
/// {@endtemplate}
@protected
abstract base class MeeMCoreException<T> extends Equatable implements Object, Exception {
  /// {@template meem_core_exception_exception}
  ///
  /// A mock exception of [MeeMCoreEvent] in 'meem_base'.
  ///
  /// {@endtemplate}
  MeeMCoreException<T> get exception;
}
