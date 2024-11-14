part of 'options.dart';

@immutable
final class ClassOptions extends MeeMBaseBuildOptions<ClassElement> {
  final ClassPrefixes? prefixes;

  final Type? extendedClass;

  final List<Type>? implements;

  final List<Type>? mixins;

  final bool hasConstructor;

  final bool? constantConstructor;

  final Parameters? parameters;

  const ClassOptions({
    required super.name,
    super.docDescription,
    this.prefixes,
    this.extendedClass,
    this.implements,
    this.mixins,
    this.hasConstructor = true,
    this.constantConstructor,
    this.parameters,
  }) : assert(
          (parameters != null && hasConstructor == true && constantConstructor != null) ||
              (parameters == null && hasConstructor == false && constantConstructor == null),
          '',
        );

  factory ClassOptions.standard(String name) => ClassOptions(name: name);

  @override
  List<Object?> get props =>
      [
        prefixes,
        implements,
        mixins,
      ] +
      super.props;
}
