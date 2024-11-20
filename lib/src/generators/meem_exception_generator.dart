import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:meta/meta.dart';
import 'package:source_gen/source_gen.dart';

import '../../meem_base_build.dart';

/// {@template meem}
///
///
///
/// {@endtemplate}
@protected
final class MeeMExceptionGenerator extends GeneratorForAnnotation<MeeMExceptionBuild> implements MeeMCodeGenerator {
  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  static const MeeMExceptionGenerator instance = MeeMExceptionGenerator._();

  const MeeMExceptionGenerator._();

  factory MeeMExceptionGenerator() => instance;

  @override
  Future<void> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async =>
      _generateForAnnotatedElement(element, annotation, buildStep);

  Future<void> _generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    if (element is! ClassElement) throw MeeMExceptionGeneratorException();
    final className = element.name;
    final exceptionClassName = '${className}Exception';
    final exceptionOutputId = buildStep.inputId.changeExtension('.exception.dart');
    final exceptionClassResult = MeeMStringService.fulfillClassTemplate(
      options: ClassOptions.framework(name: exceptionClassName),
      objectType: FrameObjectType.exception,
      template: MeeMBaseBuildTemplates.framework,
    );
    await buildStep.writeAsString(
      exceptionOutputId,
      exceptionClassResult,
    );
  }

  @override
  bool get isSingleton => true;

  @override
  List<Object?> get props => List.empty();

  @override
  bool? get stringify => false;
}

/// {@template meem}
///
///
///
/// {@endtemplate}
Builder exceptionGeneratorBuilder(BuilderOptions options) => _exceptionGeneratorBuilder(options);

Builder _exceptionGeneratorBuilder(BuilderOptions _) => SharedPartBuilder(
      [MeeMExceptionGenerator.instance],
      'meem_exception_generator',
      additionalOutputExtensions: [".exception.dart"],
    );
