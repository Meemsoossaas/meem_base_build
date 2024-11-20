part of 'annotation.dart';

@internal
final class MeeMBuild extends MeeMBuildAnnotation {
  const MeeMBuild(
    super.template, {
    super.eventOptions,
    super.exceptionClass,
  });
}

@internal
final class MeeMEventBuild extends MeeMBuildAnnotation {
  const MeeMEventBuild(
    super.template, {
    super.eventOptions,
    super.exceptionClass,
  });
}

@internal
final class MeeMExceptionBuild extends MeeMBuildAnnotation {
  const MeeMExceptionBuild(
    super.template, {
    super.eventOptions,
    super.exceptionClass,
  });
}
