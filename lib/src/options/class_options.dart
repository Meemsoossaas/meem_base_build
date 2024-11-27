part of 'options.dart';

/// {@template class_options}
///
/// A class which users can use to customize code generation preferences for a [MeeMCodeGenerator].
///
/// {@endtemplate}
@immutable
final class ClassOptions extends MeeMBaseBuildOptions<ClassElement> {
  /// {@template class_options_template}
  ///
  /// The template which could depend on the constructor.
  ///
  /// {@endtemplate}
  final MeeMBaseBuildTemplates? template;

  /// {@template class_options_prefixes}
  ///
  /// The prefix of the class of the file to be generated.
  ///
  /// {@endtemplate}
  final ClassPrefixes? prefixes;

  /// {@template class_options_extended_class}
  ///
  /// The class the class of the file to be generated inherits.
  ///
  /// {@endtemplate}
  final Type? extendedClass;

  /// {@template class_options_implements}
  ///
  /// All the interfaces which should be implemented in the class of the file to be generated.
  ///
  /// {@endtemplate}
  final List<Type>? implements;

  /// {@template class_options_mixins}
  ///
  /// All the mixins which should be mixed in in the class of the file to be generated.
  ///
  /// {@endtemplate}
  final List<Type>? mixins;

  /// {@template class_options_has_constructor}
  ///
  /// Sets, if the class of the file to be generated has a 'normal' constructor.
  ///
  /// {@endtemplate}
  final bool hasConstructor;

  /// {@template class_options_constant_constructor}
  ///
  /// Sets, if the class of the file to be generated has a const constructor.
  ///
  /// {@endtemplate}
  final bool? constantConstructor;

  /// {@template class_options_parameters}
  ///
  /// Contains all provided parameters dependent of [ParameterType].
  ///
  /// {@endtemplate}
  final Parameters parameters;

  /// {@template class_options_generics}
  ///
  /// Contains all provided generics.
  ///
  /// {@endtemplate}
  final Generics generics;

  /// {@template class_options_front_framework_generics}
  ///
  /// Sets, if the [generics] is a part of the declaration of the class of the file to be generated.
  ///
  /// {@endtemplate}
  final bool frontFrameworkGenerics;

  /// {@template class_options_class_annotation}
  ///
  /// Represents the primary annotation of the class of the file to be generated.
  ///
  /// {@endtemplate}
  final Object? classAnnotation;

  /// {@template class_options_class_getters}
  ///
  /// Contains all getters and (if [setter] is [true]) the setters of the class of the file to be generated.
  ///
  /// {@endtemplate}
  final GetterSetterProperties getters;

  /// {@macro class_options}
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

  /// {@template class_options_framework}
  ///
  /// The constructor which fits [MeeMBaseBuildTemplates.framework].
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

  /// {@template class_options_standard}
  ///
  /// A factory which represents the default input of [this].
  ///
  /// {@endtemplate}
  factory ClassOptions.standard(String name) => ClassOptions(name: name);

  /// {@template class_options_is_for_event}
  ///
  /// Gets a [bool], if [this] is for a [MeeMCoreEvent].
  ///
  /// {@endtemplate}
  bool get isForEvent => name.contains('Event');

  /// {@template class_options_is_for_exception}
  ///
  /// Gets a [bool], if [this] is for a [MeeMCoreException].
  ///
  /// {@endtemplate}
  bool get isForException => name.contains('Exception');

  /// {@template class_options_copy_with}
  ///
  /// Copies [this] with optional (mapped) inputs based on [MeeMBaseBuildTemplates.framework].
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
    Generics? generics,
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
