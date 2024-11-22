part of 'core.dart';

/// {@template meem_core}
///
/// A mock class of [MeeMCore] in 'meem_base'.
///
/// {@endtemplate}
@protected
abstract base class MeeMCore<EVENT extends MeeMCoreEvent, EXCEPTION extends MeeMCoreException> extends Equatable
    implements Object {
  /// {@template meem_core_exception}
  ///
  /// A mock exception of [MeeMCore] in 'meem_base'.
  ///
  /// {@endtemplate}
  EXCEPTION get exception;
}
