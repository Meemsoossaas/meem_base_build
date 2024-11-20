part of 'annotation.dart';

/// {@template meem}
///
///
///
/// {@endtemplate}
@internal
abstract base class MeeMBuildAnnotation extends MeeMCoreAnnotation {
  final MeeMBaseBuildTemplates template;
  final Map<String, Object?>? eventOptions;
  final Map<String, Object?>? exceptionClass;

  const MeeMBuildAnnotation(
    this.template, {
    this.eventOptions,
    this.exceptionClass,
  });

  @override
  List<Object?> get props => [
        template,
        eventOptions,
        exceptionClass,
      ];
}
