part of 'generators.dart';

/// {@template meem_base_build_templates}
///
/// An enumeration which contains all templates for the code generation processes.
/// As an enumeration, it makes more sense due to exhaustion.
///
/// {@endtemplate}
enum MeeMBaseBuildTemplates {
  /// {@template meem_base_build_templates_framework}
  ///
  /// The default template for generating an event (as [MeeMCoreEvent]) and an exception class (as [MeeMCoreException]).
  ///
  /// {@endtemplate}
  framework();

  /// {@macro meem_base_build_templates}
  const MeeMBaseBuildTemplates();
}
