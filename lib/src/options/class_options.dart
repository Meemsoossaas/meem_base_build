part of 'options.dart';

@immutable
final class ClassOptions extends MeeMBaseBuildOptions<ClassElement> {
  final MeeMBaseBuildTemplates? template;

  final ClassPrefixes? prefixes;

  final Type? extendedClass;

  final List<Type>? implements;

  final List<Type>? mixins;

  final bool hasConstructor;

  final bool? constantConstructor;

  final Parameters parameters;

  final List<Generic> generics;

  final bool frontFrameworkGenerics;

  final Object? classAnnotation;

  final List<GetterSetterProperty> getters;

  ClassOptions({
    required super.name,
    super.docDescription,
    this.prefixes,
    this.extendedClass,
    this.implements,
    this.mixins,
    this.hasConstructor = true,
    this.constantConstructor,
    this.parameters = const {},
    this.generics = const [],
    this.classAnnotation,
    this.getters = const [],
  })  : frontFrameworkGenerics = false,
        template = null,
        assert(
          (parameters.isNotEmpty && hasConstructor == true && constantConstructor != null) ||
              (parameters.isEmpty && hasConstructor == false && constantConstructor == null),
          '',
        );

  const ClassOptions.framework({
    required super.name,
    super.docDescription,
    this.prefixes = ClassPrefixes.base,
    this.implements,
    this.mixins,
    this.hasConstructor = true,
    this.parameters = const {},
    this.frontFrameworkGenerics = false,
    this.getters = const [],
  })  : constantConstructor = false,
        classAnnotation = immutable,
        extendedClass = MeeMCore,
        template = MeeMBaseBuildTemplates.framework,
        generics = const [
          (
            identifier: 'T',
            extendedType: Object,
          ),
        ];

  factory ClassOptions.standard(String name) => ClassOptions(name: name);

  bool get isForEvent => name.contains('Event');

  bool get isForException => name.contains('Exception');

  @override
  List<Object?> get props =>
      [
        extendedClass,
        prefixes,
        implements,
        mixins,
        hasConstructor,
        constantConstructor,
        parameters,
        generics,
        classAnnotation,
        getters,
      ] +
      super.props;
}
