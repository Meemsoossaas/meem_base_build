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

  final GetterSetterProperties getters;

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

  ClassOptions copyWith({
    required String? name,
    required MeeMBaseBuildTemplates template,
    ClassPrefixes? prefixes,
    Type? extendedClass,
    List<Type>? implements,
    List<Type>? mixins,
    bool? hasConstructor,
    Parameters? parameters,
    List<Generic>? generics,
    bool? frontFrameworkGenerics,
    Object? classAnnotation,
    GetterSetterProperties? getters,
  }) {
    switch (template) {
      case MeeMBaseBuildTemplates.framework:
        return ClassOptions.framework(
          name: name ?? this.name,
          prefixes: prefixes ?? this.prefixes,
          implements: implements ?? this.implements,
          mixins: mixins ?? this.mixins,
          hasConstructor: hasConstructor ?? this.hasConstructor,
          parameters: parameters ?? this.parameters,
          frontFrameworkGenerics: frontFrameworkGenerics ?? this.frontFrameworkGenerics,
          getters: getters ?? this.getters,
        );
    }
  }

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
