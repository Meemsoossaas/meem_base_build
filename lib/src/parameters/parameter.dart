part of 'parameters.dart';

/// {@template meem}
///
///
///
/// {@endtemplate}
@immutable
final class Parameter<T extends Object> extends MeeMBaseBuildParameter<T> {
  const Parameter({
    required String name,
    bool nullable = false,
    bool finalized = true,
  }) : super(name, null, true, nullable, finalized);

  @override
  ParameterType get parameterType => ParameterType.normal;

  @override
  String get asParameter => '$type${nullable ? '?' : ''} $name';
}
