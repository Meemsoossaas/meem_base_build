part of 'options.dart';

/// {@template meem}
///
///
///
/// {@endtemplate}
@protected
enum ParameterType {
  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  normal(
    openingBracket: '(',
    closingBracket: ')',
  ),

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  optional(
    openingBracket: '[',
    closingBracket: ']',
  ),

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  mapped(
    openingBracket: '{',
    closingBracket: '}',
  );

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  final String openingBracket;

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  final String closingBracket;

  const ParameterType({
    required this.openingBracket,
    required this.closingBracket,
  });

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  String get combined => '$openingBracket$closingBracket';

  /// {@template meem}
  ///
  ///
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
