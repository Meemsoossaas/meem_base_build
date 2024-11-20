part of 'options.dart';

/// {@template meem}
///
///
///
/// {@endtemplate}
@immutable
final class ClassOptions extends MeeMBaseBuildOptions<ClassElement> {
  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  final MeeMBaseBuildTemplates? template;

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  final ClassPrefixes? prefixes;

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  final Type? extendedClass;

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  final List<Type>? implements;

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  final List<Type>? mixins;

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  final bool hasConstructor;

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  final bool? constantConstructor;

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  final Parameters parameters;

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  final List<Generic> generics;

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  final bool frontFrameworkGenerics;

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  final Object? classAnnotation;

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
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

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
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

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  factory ClassOptions.standard(String name) => ClassOptions(name: name);

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  bool get isForEvent => name.contains('Event');

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  bool get isForException => name.contains('Exception');

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
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
