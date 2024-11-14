part of 'parameters.dart';

@immutable
sealed class MeeMBaseBuildParameter<T extends Object> extends Equatable implements Object {
  final String name;
  final T? defaultValue;
  final bool required;
  final bool nullable;

  const MeeMBaseBuildParameter(
    this.name,
    this.defaultValue,
    this.required,
    this.nullable,
  );

  ParameterType get parameterType;

  Type get type => defaultValue.runtimeType;

  ParameterRecord<T> get asRecord => (
        type: type,
        name: name,
        defaultValue: defaultValue,
        required: required,
        nullable: nullable,
      );

  @override
  List<Object?> get props => [
        name,
        defaultValue,
        required,
        nullable,
      ];
}
