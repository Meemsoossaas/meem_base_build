part of 'core.dart';

/// {@template format_class_header_step}
///
/// An enumeration representing all steps of [MeeMStringService.formatClassHeader].
///
/// {@endtemplate}
enum FormatClassHeaderStep implements Comparable<FormatClassHeaderStep> {
  /// {@template format_class_header_step_prefix}
  ///
  /// The first step of setting the prefix of the class.
  /// See [ClassPrefixes] for more info.
  ///
  /// {@endtemplate}
  prefix(),

  /// {@template format_class_header_step_name}
  ///
  /// The second step of setting the name of the class.
  ///
  /// {@endtemplate}
  name(),

  /// {@template format_class_header_step_declared_generics}
  ///
  /// The third step of setting the generics to be declared int the body of the class.
  /// See [Generic] for more info.
  ///
  /// {@endtemplate}
  declaredGenerics(),

  /// {@template format_class_header_step_extended_class}
  ///
  /// The fourth step of setting the extended class.
  ///
  /// {@endtemplate}
  extendedClass(),

  /// {@template format_class_header_step_mixins}
  ///
  /// The fifth step of setting all mixins included in the class.
  ///
  /// {@endtemplate}
  mixins(),

  /// {@template format_class_header_step_implementers}
  ///
  /// The sixth (and last) step of setting all classes to be implemented.
  ///
  /// {@endtemplate}
  implementers();

  /// {@macro format_class_header_step}
  const FormatClassHeaderStep();

  @override
  int compareTo(FormatClassHeaderStep other) => (index > other.index) ? index : other.index;
}
