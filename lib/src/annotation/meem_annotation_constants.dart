part of 'annotation.dart';

/// {@template meem}
///
/// Universal standard annotation for generating affiliated event and exception classes
///
/// {@endtemplate}
const meem = MeeMBuild(
  MeeMBaseBuildTemplates.framework,
);

/// {@template event}
///
/// Universal standard annotation for generating affiliated event classes
///
/// {@endtemplate}
const event = MeeMEventBuild(
  MeeMBaseBuildTemplates.framework,
);

/// {@template exception}
///
/// Universal standard annotation for generating affiliated exception classes
///
/// {@endtemplate}
const exception = MeeMExceptionBuild(
  MeeMBaseBuildTemplates.framework,
);
