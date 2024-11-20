part of 'parameters.dart';

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
}
