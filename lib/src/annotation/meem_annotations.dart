part of 'annotation.dart';

/// {@template meem}
///
///
///
/// {@endtemplate}
@immutable
final class MeeMBuild extends MeeMBuildAnnotation {
  const MeeMBuild(
    super.template, {
    super.eventOptions,
    super.exceptionClass,
  });
}

/// {@template meem}
///
///
///
/// {@endtemplate}
@immutable
final class MeeMEventBuild extends MeeMBuildAnnotation {
  const MeeMEventBuild(
    super.template, {
    super.eventOptions,
  });
}

/// {@template meem}
///
///
///
/// {@endtemplate}
@immutable
final class MeeMExceptionBuild extends MeeMBuildAnnotation {
  const MeeMExceptionBuild(
    super.template, {
    super.exceptionClass,
  });
}
