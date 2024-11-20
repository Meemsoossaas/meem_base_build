part of 'core.dart';

/// {@template meem}
///
///
///
/// {@endtemplate}
@internal
typedef Annotations = Map<String, MeeMCoreAnnotation>;

/// {@template meem}
///
///
///
/// {@endtemplate}
typedef ExceptionResult<T, V extends Object> = T Function(V instance)?;

/// {@template meem}
///
///
///
/// {@endtemplate}
typedef ParameterRecord<T extends Object> = ({
  Type type,
  String name,
  T? defaultValue,
  bool required,
  bool nullable,
  bool finalized,
});

/// {@template meem}
///
///
///
/// {@endtemplate}
typedef Parameters = Map<ParameterType, List<Parameter>>;

/// {@template meem}
///
///
///
/// {@endtemplate}
typedef BufferParameterResult = ({
  String normalParameterResult,
  String optionalParameterResult,
  String mappedParameterResult,
});

/// {@template meem}
///
///
///
/// {@endtemplate}
typedef Generic = ({
  String identifier,
  Type? extendedType,
});

/// {@template meem}
///
///
///
/// {@endtemplate}
typedef GetterSetterProperty = ({
  String name,
  bool nullable,
  bool setter,
});

/// {@template meem}
///
///
///
/// {@endtemplate}
typedef GetterSetterProperties = List<GetterSetterProperty>;
