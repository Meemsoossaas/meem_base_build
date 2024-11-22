part of 'parameters.dart';

/// {@template meem_base_build_parameter}
///
/// A class which serves as a base for all the the types of parameters (which are based on [ParameterType]).
///
/// {@endtemplate}
@protected
sealed class MeeMBaseBuildParameter<T extends Object> extends Equatable implements Object {
  /// {@template meem_base_build_parameter_name}
  ///
  /// The name of the parameter.
  ///
  /// {@endtemplate}
  final String name;

  /// {@template meem_base_build_default_value}
  ///
  /// The default value of the parameter (which could also be [null] if [nullable] is [true]).
  ///
  /// {@endtemplate}
  final T? defaultValue;

  /// {@template meem_base_build_required}
  ///
  /// Sets, if the parameter must be passed (which can also be case if it is [nullable]).
  ///
  /// {@endtemplate}
  final bool required;

  /// {@template meem_base_build_nullable}
  ///
  /// Sets, if the parameter is nullable.
  ///
  /// {@endtemplate}
  final bool nullable;

  /// {@template meem_base_build_finalized}
  ///
  /// Sets, if the parameter is [final].
  /// This is crucial for the property presentation of [this].
  /// This relates, if the class (as a whole) is [immutable].
  ///
  /// {@endtemplate}
  final bool finalized;

  /// {@macro meem_base_build_parameter}
  const MeeMBaseBuildParameter(
    this.name,
    this.defaultValue,
    this.required,
    this.nullable,
    this.finalized,
  );

  /// {@template meem_base_build_parameter_parameter_type}
  ///
  /// The type of this.
  ///
  /// {@endtemplate}
  ParameterType get parameterType;

  /// {@template meem_base_build_parameter_as_parameter}
  ///
  /// Converts this into a single format line.
  /// See [MeeMStringService.classParameterLineBreak] for more info.
  ///
  /// {@endtemplate}
  String get asParameter;

  /// {@template meem_base_build_parameter_type}
  ///
  /// Gets [T] as a [runtimeType].
  ///
  /// {@endtemplate}
  Type get type => defaultValue.runtimeType;

  /// {@template meem_base_build_parameter_as_record}
  ///
  /// Converts this into a [ParameterRecord].
  ///
  /// {@endtemplate}
  ParameterRecord<T> get asRecord => (
        type: type,
        name: name,
        defaultValue: defaultValue,
        required: required,
        nullable: nullable,
        finalized: finalized,
      );

  /// {@template meem_base_build_parameter_as_property}
  ///
  /// Converts this into a single format line of a property expression.
  ///
  /// {@endtemplate}
  String get asProperty => _asProperty;

  String get _asProperty => finalized ? 'final $type${nullable ? '?' : ''} $name' : 'final $type $name';

  @override
  List<Object?> get props => [
        name,
        defaultValue,
        required,
        nullable,
        finalized,
      ];
}
