part of 'options.dart';

/// {@template meem}
///
///
///
/// {@endtemplate}
enum ClassPrefixes {
  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  base(syntax: 'base'),

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  interface(syntax: 'interface'),

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  finalized(syntax: 'final'),

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  sealed(syntax: 'sealed'),

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  abstract(syntax: 'abstract'),

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  abstractBase(syntax: 'abstract base'),

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  abstractInterface(syntax: 'abstract interface'),

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  abstractFinal(syntax: 'abstract final');

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  final String syntax;

  const ClassPrefixes({
    required this.syntax,
  });

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  String get combine => '$syntax class';
}
