part of 'parameters.dart';

@immutable
final class MappedParameter<T extends Object> extends MeeMBaseBuildParameter<T> {
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
