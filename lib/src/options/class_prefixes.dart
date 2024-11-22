part of 'options.dart';

/// {@template class_prefixes}
///
/// An enumeration containing all class modifier references.
/// See (https://dart.dev/language/modifier-reference) for more info.
///
/// {@endtemplate}
enum ClassPrefixes {
  /// {@template class_prefixes_base}
  ///
  /// Basically: 'base class'.
  ///
  /// {@endtemplate}
  base(syntax: 'base'),

  /// {@template class_prefixes_interface}
  ///
  /// Basically: 'interface class'.
  ///
  /// {@endtemplate}
  interface(syntax: 'interface'),

  /// {@template class_prefixes_finalized}
  ///
  /// Basically: 'final class'.
  ///
  /// {@endtemplate}
  finalized(syntax: 'final'),

  /// {@template class_prefixes_sealed}
  ///
  /// Basically: 'sealed class'.
  ///
  /// {@endtemplate}
  sealed(syntax: 'sealed'),

  /// {@template class_prefixes_abstract}
  ///
  /// Basically: 'abstract class'.
  ///
  /// {@endtemplate}
  abstract(syntax: 'abstract'),

  /// {@template class_prefixes_abstract_base}
  ///
  /// Basically: 'abstract base class'.
  ///
  /// {@endtemplate}
  abstractBase(syntax: 'abstract base'),

  /// {@template class_prefixes_abstract_interface}
  ///
  /// Basically: 'abstract interface class'.
  ///
  /// {@endtemplate}
  abstractInterface(syntax: 'abstract interface'),

  /// {@template class_prefixes_abstract_final}
  ///
  /// Basically: 'abstract final class'.
  ///
  /// {@endtemplate}
  abstractFinal(syntax: 'abstract final');

  /// {@template class_prefixes_syntax}
  ///
  /// The logical keyword syntax of the classes prefix.
  ///
  /// {@endtemplate}
  final String syntax;

  /// {@macro class_prefixes}
  const ClassPrefixes({
    required this.syntax,
  });

  /// {@template class_prefixes_combine}
  ///
  /// Gets the full class prefix.
  ///
  /// {@endtemplate}
  String get combine => '$syntax class';
}
