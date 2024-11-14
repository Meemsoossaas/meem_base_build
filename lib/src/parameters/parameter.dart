part of 'parameters.dart';

@immutable
final class Parameter<T extends Object> extends MeeMBaseBuildParameter<T> {
  const Parameter({
    required String name,
    bool nullable = false,
  }) : super(name, null, true, nullable);

  @override
  ParameterType get parameterType => ParameterType.normal;
}
