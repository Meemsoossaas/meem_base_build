part of 'parameters.dart';

/// {@template mapped_parameter}
///
/// A class which presents a parameter with the type [ParameterType.mapped].
///
/// {@endtemplate}
@immutable
final class MappedParameter<T extends Object> extends MeeMBaseBuildParameter<T> {
  /// {@macro mapped_parameter}
  const MappedParameter({
    required String name,
    T? defaultValue,
    bool required = true,
    bool nullable = true,
    bool finalized = true,
  }) : super(
          name,
          defaultValue,
          required,
          nullable,
          finalized,
        );

  @override
  ParameterType get parameterType => ParameterType.mapped;

  @override
  String get asParameter =>
      '${required ? 'required ' : ''}$type${nullable ? '?' : ''} $name${defaultValue != null ? ' = ${defaultValue!}' : ''},';

  @override
  MeeMBaseBuildParameter<Object> copyWith({
    String? name,
    T? defaultValue,
    bool? required,
    bool? nullable,
    bool? finalized,
  }) =>
      MappedParameter(
        name: name ?? this.name,
        defaultValue: defaultValue ?? this.defaultValue,
        required: required ?? this.required,
        nullable: nullable ?? this.nullable,
        finalized: finalized ?? this.finalized,
      );
}
