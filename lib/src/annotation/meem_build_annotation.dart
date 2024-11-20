part of 'annotation.dart';

abstract base class MeeMBuildAnnotation extends MeeMCoreAnnotation {
  final MeeMBaseBuildTemplates template;

  const MeeMBuildAnnotation(this.template);

  @override
  List<Object?> get props => [template];
}
