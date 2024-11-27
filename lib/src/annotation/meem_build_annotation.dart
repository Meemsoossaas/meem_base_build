part of 'annotation.dart';

/// {@template meem_build_annotation}
///
/// A class which serves the base for the usable annotation.
/// See: [MeeMBuild], [MeeMEventBuild] & [MeeMExceptionBuild]
///
/// Currently for [template], there is one legitimate template for generating code ([MeeMBaseBuildTemplates.framework]).
/// This means currently, [template] shouldn't be modified.
///
/// {@endtemplate}
@immutable
abstract base class MeeMBuildAnnotation extends MeeMCoreAnnotation {
  /// {@template meem_build_annotation_template}
  ///
  /// The provided template.
  ///
  /// {@endtemplate}
  final MeeMBaseBuildTemplates template;

  /// {@template meem_build_annotation_event_options}
  ///
  /// The provided customizable options for the generated [MeeMCoreEvent].
  ///
  /// {@endtemplate}
  final AnnotationMap? eventOptions;

  /// {@template meem_build_annotation_exception_options}
  ///
  /// The provided customizable options for the generated [MeeMCoreException].
  ///
  /// {@endtemplate}
  final AnnotationMap? exceptionOptions;

  /// {@macro meem_build_annotation}
  const MeeMBuildAnnotation({
    this.template = MeeMBaseBuildTemplates.framework,
    this.eventOptions,
    this.exceptionOptions,
  });

  @override
  List<Object?> get props => [
        template,
        eventOptions,
        exceptionOptions,
      ];
}
