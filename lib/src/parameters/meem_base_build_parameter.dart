part of 'parameters.dart';

/// {@template meem}
///
///
///
/// {@endtemplate}
@protected
sealed class MeeMBaseBuildParameter<T extends Object> extends Equatable implements Object {
  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  final String name;

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  final T? defaultValue;

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  final bool required;

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  final bool nullable;

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  final bool finalized;

  const MeeMBaseBuildParameter(
    this.name,
    this.defaultValue,
    this.required,
    this.nullable,
    this.finalized,
  );

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  ParameterType get parameterType;

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  String get asParameter;

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  Type get type => defaultValue.runtimeType;

  /// {@template meem}
  ///
  ///
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

  /// {@template meem}
  ///
  ///
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
