part of 'options.dart';

/// {@template frame_object_type}
///
/// An enumeration (especially for [MeeMBaseBuildTemplates.framework]) which contains different 'types' of classes to be generated.
///
/// {@endtemplate}
@internal
enum FrameObjectType {
  /// {@template frame_object_type_event}
  ///
  /// The type affiliated to [MeeMCoreEvent].
  ///
  /// {@endtemplate}
  event(),

  /// {@template frame_object_type_exception}
  ///
  /// The type affiliated to [MeeMCoreException].
  ///
  /// {@endtemplate}
  exception();

  /// {@macro frame_object_type}
  const FrameObjectType();
}
