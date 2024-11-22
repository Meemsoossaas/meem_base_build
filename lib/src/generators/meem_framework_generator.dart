import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:meem_base_build/src/extensions/extensions.dart';
import 'package:meta/meta.dart' show immutable, protected;
import 'package:source_gen/source_gen.dart';

import '../../meem_base_build.dart';

/// {@template meem_framework_generator}
///
/// The code generator for event (based on [MeeMCoreEvent]) and exception classes (based on [MeeMCoreException]).
///
/// {@endtemplate}
@protected
final class MeeMFrameworkGenerator extends GeneratorForAnnotation<MeeMBuild> implements MeeMCodeGenerator {
  /// {@macro meem_framework_generator}
  static const MeeMFrameworkGenerator instance = MeeMFrameworkGenerator._();

  @protected
  const MeeMFrameworkGenerator._();

  /// {@macro meem_framework_generator}
  factory MeeMFrameworkGenerator() => instance;

  @override
  Future<void> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async =>
      await _generateForAnnotatedElement(element, annotation, buildStep);

  Future<void> _generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    if (element is! ClassElement) throw MeeMFrameworkGeneratorException();
    final className = element.name;

    final eventOptions =
        annotation.peek('eventOptions')?.mapValue.toEventClassOptions(MeeMBaseBuildTemplates.framework);
    final eventClassName = '${className}Event';
    final eventOutputId = buildStep.inputId.changeExtension('.event.dart');
    final eventClassResult = MeeMStringService.fulfillClassTemplate(
      options: eventOptions?.copyWith(
            name: eventClassName,
            template: MeeMBaseBuildTemplates.framework,
          ) ??
          ClassOptions.framework(name: eventClassName),
      objectType: FrameObjectType.event,
      template: MeeMBaseBuildTemplates.framework,
    );
    await buildStep.writeAsString(
      eventOutputId,
      eventClassResult,
    );

    final exceptionOptions =
        annotation.peek('exceptionOptions')?.mapValue.toEventClassOptions(MeeMBaseBuildTemplates.framework);
    final exceptionClassName = '${className}Exception';
    final exceptionOutputId = buildStep.inputId.changeExtension('.exception.dart');
    final exceptionClassResult = MeeMStringService.fulfillClassTemplate(
      options: exceptionOptions?.copyWith(
            name: exceptionClassName,
            template: MeeMBaseBuildTemplates.framework,
          ) ??
          ClassOptions.framework(name: exceptionClassName),
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

/// {@template meem_framework_generator_framework_generator_builder}
///
/// The affiliated builder for [MeeMFrameworkGenerator].
///
/// {@endtemplate}
@protected
Builder frameworkGeneratorBuilder(BuilderOptions options) => _frameworkGeneratorBuilder(options);

@protected
Builder _frameworkGeneratorBuilder(BuilderOptions _) => SharedPartBuilder(
      [MeeMFrameworkGenerator.instance],
      'meem_framework_generator',
      additionalOutputExtensions: [
        ".event.dart",
        ".exception.dart",
      ],
    );
