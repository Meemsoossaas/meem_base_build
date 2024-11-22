part of 'parameters.dart';

/// {@template parameter}
///
/// A class which presents a parameter with the type [ParameterType.normal].
///
/// {@endtemplate}
@immutable
final class Parameter<T extends Object> extends MeeMBaseBuildParameter<T> {
  /// {@macro parameter}
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
