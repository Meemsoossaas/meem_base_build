part of 'core.dart';

/// {@template format_class_constructor_step}
///
/// An enumeration representing all steps of [MeeMStringService.formatConstructor].
///
/// {@endtemplate}
@internal
enum FormatClassConstructorStep implements Comparable<FormatClassConstructorStep> {
  /// {@template format_class_constructor_step_constructor_prefix}
  ///
  /// The first step of setting the prefix of the constructor.
  /// This means it sets, if the constructor is constant or not.
  ///
  /// {@endtemplate}
  constructorPrefix(),

  /// {@template format_class_constructor_step_constructor_name}
  ///
  /// The second step of setting the name of the constructor.
  /// This leads to the constructor having the nameless constructor (Class();) or a named constructor (Class.foo();).
  ///
  /// {@endtemplate}
  constructorName(),

  /// {@template format_class_constructor_step_parameters}
  ///
  /// The third step of visualizing all the parameters.
  /// See [ParameterType] for more info.
  ///
  /// {@endtemplate}
  parameters(),

  /// {@template meem}
  ///
  /// The fourth step of adding code which runs post initializing the constructor.
  ///
  /// {@endtemplate}
  postInitializing(),

  /// {@template meem}
  ///
  /// The fifth (and last) step of assertion attempt based on the initializing of the constructor.
  ///
  /// {@endtemplate}
  assertion();

  /// {@macro format_class_constructor_step}
  const FormatClassConstructorStep();

  @override
  int compareTo(FormatClassConstructorStep other) => (index > other.index) ? index : other.index;
}
