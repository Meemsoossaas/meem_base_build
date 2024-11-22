import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:meta/meta.dart';
import 'package:source_gen/source_gen.dart';

import '../../meem_base_build.dart';

/// {@template meem_exception_generator}
///
/// The code generator for exception classes which are based on [MeeMCoreException].
///
/// {@endtemplate}
@protected
final class MeeMExceptionGenerator extends GeneratorForAnnotation<MeeMExceptionBuild> implements MeeMCodeGenerator {
  /// {@macro meem_exception_generator}
  static const MeeMExceptionGenerator instance = MeeMExceptionGenerator._();

  @override
  const MeeMExceptionGenerator._();

  /// {@macro meem_exception_generator}
  factory MeeMExceptionGenerator() => instance;

  @override
  Future<void> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async =>
      await _generateForAnnotatedElement(element, annotation, buildStep);

  @protected
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
  bool get isSingleton => MeeMCoreGenerator.generatorsAreSingleton;

  @override
  List<Object?> get props => List.empty();

  @override
  bool? get stringify => false;
}

/// {@template meem_exception_generator_exception_generator_builder}
///
/// The affiliated builder for [MeeMExceptionGenerator].
///
/// {@endtemplate}
@protected
Builder exceptionGeneratorBuilder(BuilderOptions options) => _exceptionGeneratorBuilder(options);

@protected
Builder _exceptionGeneratorBuilder(BuilderOptions _) => SharedPartBuilder(
      [MeeMExceptionGenerator.instance],
      'meem_exception_generator',
      additionalOutputExtensions: [".exception.dart"],
    );
