part of 'core.dart';

/// mimic class
abstract base class MeeMCore<EVENT extends MeeMCoreEvent, EXCEPTION extends MeeMCoreException> {
  EXCEPTION get exception;
}
