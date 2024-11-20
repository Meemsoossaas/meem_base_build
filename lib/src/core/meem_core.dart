part of 'core.dart';

/// {@template meem}
///
///
///
/// {@endtemplate}
@protected
abstract base class MeeMCore<EVENT extends MeeMCoreEvent, EXCEPTION extends MeeMCoreException> {
  EXCEPTION get exception;
}
