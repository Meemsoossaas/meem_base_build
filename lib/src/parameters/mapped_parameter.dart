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
      '${this.required ? 'required ' : ''}$type${nullable ? '?' : ''} $name${defaultValue != null ? ' = ${defaultValue!}' : ''},';
}
