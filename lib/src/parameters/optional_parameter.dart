part of 'parameters.dart';

/// {@template optional_parameter}
///
/// A class which presents a parameter with the type [ParameterType.optional].
///
/// {@endtemplate}
@immutable
final class OptionalParameter<T extends Object> extends MeeMBaseBuildParameter<T> {
  const OptionalParameter({
    required String name,
    T? defaultValue,
    bool nullable = false,
    bool finalized = true,
  }) : super(
          name,
          defaultValue,
          false,
          nullable,
          finalized,
        );

  @override
  ParameterType get parameterType => ParameterType.optional;

  @override
  String get asParameter => '$type${nullable ? '?' : ''} $name${defaultValue != null ? ' = ${defaultValue!}' : ''},';

  @override
  MeeMBaseBuildParameter<Object> copyWith({
    String? name,
    T? defaultValue,
    bool? required,
    bool? nullable,
    bool? finalized,
  }) =>
      OptionalParameter(
        name: name ?? this.name,
        defaultValue: defaultValue ?? this.defaultValue,
        nullable: nullable ?? this.nullable,
        finalized: finalized ?? this.finalized,
      );
}
