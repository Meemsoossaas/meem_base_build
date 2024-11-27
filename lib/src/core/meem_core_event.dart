part of 'core.dart';

/// {@template meem_core_event}
///
/// A mock event class of [MeeMCoreEvent] in 'meem_base'.
///
/// {@endtemplate}
@immutable
abstract base class MeeMCoreEvent<T extends Object> extends Equatable implements Object {
  /// {@template meem_core_event_exception}
  ///
  /// A mock exception of [MeeMCoreEvent] in 'meem_base'.
  ///
  /// {@endtemplate}
  MeeMCoreException<T> get exception;
}
