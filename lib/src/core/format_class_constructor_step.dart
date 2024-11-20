part of 'core.dart';

/// {@template meem}
///
///
///
/// {@endtemplate}
@protected
enum FormatClassConstructorStep {
  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  constructorPrefix(),

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  constructorName(),

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  parameters(),

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  postInitializing(),

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  assertion();

  const FormatClassConstructorStep();
}
