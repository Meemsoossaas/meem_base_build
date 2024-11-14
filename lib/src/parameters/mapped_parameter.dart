part of 'parameters.dart';

@immutable
final class MappedParameter<T extends Object> extends MeeMBaseBuildParameter<T> {
  const MappedParameter({
    required String name,
    T? defaultValue,
    bool required = true,
    bool nullable = true,
  }) : super(
          name,
          defaultValue,
          required,
          nullable,
        );

  @override
  ParameterType get parameterType => ParameterType.mapped;
}
