part of 'annotation.dart';

abstract base class MeeMCoreAnnotation extends Equatable implements Object {
  static const Map<String, MeeMCoreAnnotation> allAnnotations = {
    'MeeMBuild': meem,
    'UnMeeMBuild': unmeem,
  };

  const MeeMCoreAnnotation();

  @override
  List<Object?> get props => List.empty();
}
