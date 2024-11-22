part of 'annotation.dart';

/// {@template meem_build}
///
/// A declarable annotation for generating the MeeM Framework.
/// This annotation generating from a class an affiliated event and exception class.
/// This allows users to add custom options (via [ClassOptions]).
/// [eventOptions] representing the customizability of [MeeMCoreEvent]
/// [exceptionOptions] representing the customizability of [MeeMCoreException]
/// This annotation invokes [MeeMFrameworkGenerator].
///
/// {@endtemplate}
@immutable
final class MeeMBuild extends MeeMBuildAnnotation {
  /// {@macro meem_build}
  const MeeMBuild({
    super.template,
    super.eventOptions,
    super.exceptionOptions,
  });
}

/// {@template meem_event_build}
///
/// A declarable annotation for generating only an affiliated event class.
/// [eventOptions] can obviously be customized.
/// This annotation invokes [MeeMEventGenerator]
///
/// {@endtemplate}
@immutable
final class MeeMEventBuild extends MeeMBuildAnnotation {
  /// {@macro meem_event_build}
  const MeeMEventBuild({
    super.template,
    super.eventOptions,
  });
}

/// {@template meem_exception_build}
///
/// A declarable annotation for generating only an affiliated exception class.
/// [exceptionOptions] can obviously be customized.
/// This annotation invokes [MeeMExceptionGenerator]
///
/// {@endtemplate}
@immutable
final class MeeMExceptionBuild extends MeeMBuildAnnotation {
  /// {@macro meem_exception_build}
  const MeeMExceptionBuild({
    super.template,
    super.exceptionOptions,
  });
}
