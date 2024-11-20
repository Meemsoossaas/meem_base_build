part of 'annotation.dart';

abstract base class MeeMCoreAnnotation extends Equatable implements Object {
  static const Map<Type, MeeMCoreAnnotation> allAnnotations = {
    MeeMBuild: meem,
    MeeMEventBuild: event,
    MeeMExceptionBuild: exception,
  };

  const MeeMCoreAnnotation();
}
