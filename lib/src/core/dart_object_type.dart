part of 'core.dart';

/// {@template meem}
///
///
///
/// {@endtemplate}
@protected
enum DartObjectType {
  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  classObject(keyword: 'class'),

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  mixin(keyword: 'mixin'),

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  enumeration(keyword: 'enum'),

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  extensionType(keyword: 'extension type');

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  final String keyword;

  const DartObjectType({
    required this.keyword,
  });
}
