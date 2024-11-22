part of 'core.dart';

/// {@template dart_object_type}
///
/// An enumeration representing all object types.
/// Declared as a exhaustive representation of [Element].
///
/// {@endtemplate}
@internal
enum DartObjectType {
  /// {@template dart_object_type_class_object}
  ///
  /// A representation of a class.
  ///
  /// {@endtemplate}
  classObject(keyword: 'class'),

  /// {@template dart_object_type_mixin}
  ///
  /// A representation of a mixin.
  ///
  /// {@endtemplate}
  mixin(keyword: 'mixin'),

  /// {@template dart_object_type_enumeration}
  ///
  /// A representation of an enumeration.
  ///
  /// {@endtemplate}
  enumeration(keyword: 'enum'),

  /// {@template dart_object_type_extension_type}
  ///
  /// A representation of an extension_type.
  ///
  /// {@endtemplate}
  extensionType(keyword: 'extension type');

  /// {@template dart_object_type_keyword}
  ///
  /// The keyword of this (which is basically the same as the name of the enumeration).
  ///
  /// {@endtemplate}
  final String keyword;

  /// {@macro dart_object_type}
  const DartObjectType({
    required this.keyword,
  });
}
