part of 'parameters.dart';

@immutable
final class OptionalParameter<T extends Object> extends MeeMBaseBuildParameter<T> {
  const OptionalParameter({
    required String name,
    T? defaultValue,
    bool nullable = false,
  }) : super(
          name,
          defaultValue,
          false,
          nullable,
        );

  @override
  ParameterType get parameterType => ParameterType.optional;
}
