part of 'core.dart';

typedef Annotations = Map<String, MeeMCoreAnnotation>;

typedef Code = String;

typedef ExceptionResult<T, V extends Object> = T Function(V instance)?;

typedef ParameterRecord<T extends Object> = ({
  Type type,
  String name,
  T? defaultValue,
  bool required,
  bool nullable,
});

typedef Parameters = Map<ParameterType, List<Parameter>>;

typedef BufferParameterResult = ({
  String normalParameterResult,
  String optionalParameterResult,
  String mappedParameterResult,
});

typedef Generic = ({
  String identifier,
  Type extendedType,
});
