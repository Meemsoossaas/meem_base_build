part of 'core.dart';

/// {@template meem}
///
///
///
/// {@endtemplate}
@protected
enum FormatClassHeaderStep {
  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  prefix(),

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  name(),

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  declaredGenerics(),

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  extendedClass(),

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  mixins(),

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  implementers();

  const FormatClassHeaderStep();
}
