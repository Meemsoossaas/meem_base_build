part of 'core.dart';

/// {@template annotation_map}
///
/// Represents the input on a [MeeMBuildAnnotation] for a [ClassOptions] on a [MeeMBuildAnnotation].
/// This will be converted into a [ClassOptions].
/// See [toEventClassOptions].
///
/// {@endtemplate}
@internal
typedef AnnotationMap = Map<String, Object?>;

/// {@template annotations}
///
/// Represents a map containing all usable annotation for the user.
///
/// {@endtemplate}
@internal
typedef Annotations = Map<Type, MeeMCoreAnnotation>;

/// {@template exception_result}
///
/// A callback function for [MeeMBaseBuildCoreException] which returns [T] as a value which represents the exception.
///
/// {@endtemplate}
@internal
typedef ExceptionResult<T, V extends Object> = T Function(V instance)?;

/// {@template parameter_record}
///
/// A record representing a parameter of a class where [T] is the [Type] itself.
/// This can be converted as so via [Parameter]
///
/// {@endtemplate}
@internal
typedef ParameterRecord<T extends Object> = ({
  Type type,
  String name,
  T? defaultValue,
  bool required,
  bool nullable,
  bool finalized,
});

/// {@template parameters}
///
/// A map containing [Parameter] for each type of parameter.
/// The length of this can only be one or two.
/// This is because there cannot be optional and mapped parameters in the same class constructor.
/// This is being asserted in [MeeMStringService].
///
/// {@endtemplate}
@internal
typedef Parameters = Map<ParameterType, List<Parameter>>;

/// {@template buffer_parameter_result}
///
/// A record which provides all parameters as strings.
///
/// Valid scenarios include:
///
/// - Each result is an empty string (no parameters)
/// - One result is an empty string
///   - This can lead to: [ParameterType.normal] + [ParameterType.optional]
///   - or: [ParameterType.normal] + [ParameterType.mapped]
/// - Two results are an empty string
///   - This can lead to: [ParameterType.normal]
///   - or: [ParameterType.optional]
///   - or: [ParameterType.mapped]
///
/// {@endtemplate}
@internal
typedef BufferParameterResult = ({
  String normalParameterResult,
  String optionalParameterResult,
  String mappedParameterResult,
});

/// {@template generic}
///
/// A record which represents a generic (like [T]) to be "stringified".
///
/// {@endtemplate}
@internal
typedef Generic = ({
  String identifier,
  Type? extendedType,
});

/// {@template generics}
///
/// A list of [Generic];
///
/// {@endtemplate}
@internal
typedef Generics = List<Generic>;

/// {@template getter_setter_property}
///
/// A record which represents a getter (and a setter if [setter] is [true]).
///
/// {@endtemplate}
@internal
typedef GetterSetterProperty = ({
  String name,
  bool nullable,
  bool setter,
});

/// {@template GetterSetterProperties}
///
/// A list of [GetterSetterProperty].
///
/// {@endtemplate}
@internal
typedef GetterSetterProperties = List<GetterSetterProperty>;
