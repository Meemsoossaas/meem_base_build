part of 'annotation.dart';

/// {@template meem_core_annotation}
///
/// A class which serves the basis for the framework of annotation in the API.
///
/// {@endtemplate}
@immutable
abstract base class MeeMCoreAnnotation extends Equatable implements Object {
  /// {@template meem_core_annotation_all_annotations}
  ///
  /// Contains all universal usable annotations which can be utilized by the user.
  ///
  /// {@endtemplate}
  static const Annotations allAnnotations = {
    MeeMBuild: meem,
    MeeMEventBuild: event,
    MeeMExceptionBuild: exception,
  };

  /// {@macro meem_core_annotation}
  const MeeMCoreAnnotation();
}
