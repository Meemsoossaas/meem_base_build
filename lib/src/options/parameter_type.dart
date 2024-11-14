part of 'options.dart';

enum ParameterType {
  normal(
    openingBracket: '(',
    closingBracket: ')',
  ),
  optional(
    openingBracket: '[',
    closingBracket: ']',
  ),
  mapped(
    openingBracket: '{',
    closingBracket: '}',
  );

  final String openingBracket;

  final String closingBracket;

  const ParameterType({
    required this.openingBracket,
    required this.closingBracket,
  });

  String get combined => '$openingBracket$closingBracket';

  bool combinable(ParameterType other) {
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
