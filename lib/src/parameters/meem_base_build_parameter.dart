part of 'parameters.dart';

@immutable
sealed class MeeMBaseBuildParameter<T extends Object> extends Equatable implements Object {
  final String name;
  final T? defaultValue;
  final bool required;
  final bool nullable;
  final bool finalized;

  const MeeMBaseBuildParameter(
    this.name,
    this.defaultValue,
    this.required,
    this.nullable,
    this.finalized,
  );

  ParameterType get parameterType;

  String get asParameter;

  Type get type => defaultValue.runtimeType;

  ParameterRecord<T> get asRecord => (
        type: type,
        name: name,
        defaultValue: defaultValue,
        required: required,
        nullable: nullable,
        finalized: finalized,
      );

  String get asProperty => finalized ? 'final $type${nullable ? '?' : ''} $name' : 'final ${type} $name';

  @override
  List<Object?> get props => [
        name,
        defaultValue,
        required,
        nullable,
        finalized,
      ];
}
