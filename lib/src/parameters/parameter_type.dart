part of 'parameters.dart';

/// {@template parameter_type}
///
/// An enumeration which contains all types of parameters in Dart.
///
/// {@endtemplate}
enum ParameterType {
  /// {@template parameter_type_normal}
  ///
  /// Represents a 'normal' parameter.
  /// Example: 'Class(int i);'.
  ///
  /// {@endtemplate}
  normal(
    openingBracket: '(',
    closingBracket: ')',
  ),

  /// {@template parameter_type_optional}
  ///
  /// Represents an optional parameter.
  /// Example: 'Class([int? i]);'.
  ///
  /// {@endtemplate}
  optional(
    openingBracket: '[',
    closingBracket: ']',
  ),

  /// {@template parameter_type_mapped}
  ///
  /// Represents a mapped parameter.
  /// Example: 'Class({int? i});'.
  ///
  /// {@endtemplate}
  mapped(
    openingBracket: '{',
    closingBracket: '}',
  );

  /// {@template parameter_type_opening_bracket}
  ///
  /// The opening bracket the parameter would be in.
  ///
  /// {@endtemplate}
  final String openingBracket;

  /// {@template parameter_type_closing_bracket}
  ///
  /// The closing bracket the parameter would be in.
  ///
  /// {@endtemplate}
  final String closingBracket;

  /// {@macro parameter_type}
  const ParameterType({
    required this.openingBracket,
    required this.closingBracket,
  });

  /// {@template parameter_type_combined}
  ///
  /// Combines [openingBracket] and [closingBracket].
  ///
  /// {@endtemplate}
  String get combined => '$openingBracket$closingBracket';

  /// {@template parameter_type_combinable}
  ///
  /// Checks, if [other] (with [this]) is in a combined parameter scenario compatible.
  ///
  /// {@endtemplate}
  bool combinable(ParameterType other) => _combinable(other);

  bool _combinable(ParameterType other) {
    switch (this) {
      case ParameterType.normal:
        switch (other) {
          case ParameterType.normal:
            throw Exception();
          case ParameterType.optional:
            return true;
          case ParameterType.mapped:
            return true;
        }
      case ParameterType.optional:
        switch (other) {
          case ParameterType.normal:
            return true;
          case ParameterType.optional:
            throw Exception();
          case ParameterType.mapped:
            return false;
        }
      case ParameterType.mapped:
        switch (other) {
          case ParameterType.normal:
            return true;
          case ParameterType.optional:
            return false;
          case ParameterType.mapped:
            throw Exception();
        }
    }
  }
}
