import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:meta/meta.dart' show immutable;
import 'package:source_gen/source_gen.dart';

import '../../meem_base_build.dart';

@immutable
final class MeeMFrameworkGenerator extends GeneratorForAnnotation<MeeMBuild> implements MeeMCodeGenerator {
  static const MeeMFrameworkGenerator instance = MeeMFrameworkGenerator._();

  const MeeMFrameworkGenerator._();

  factory MeeMFrameworkGenerator() => instance;

  @override
  Future<void> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    if (element is! ClassElement) throw MeeMFrameworkGeneratorException();
    final className = element.name;

    final eventClassName = '${className}Event';
    final eventOutputId = buildStep.inputId.changeExtension('.event.dart');
    final eventClassResult = MeeMStringService.fulfillClassTemplate(
      options: ClassOptions.framework(name: eventClassName),
      objectType: FrameObjectType.event,
      template: MeeMBaseBuildTemplates.framework,
    );
    await buildStep.writeAsString(
      eventOutputId,
      eventClassResult,
    );
    print(eventClassResult);

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

    print(exceptionClassResult);
  }

  @override
  List<Object?> get props => List.empty();

  @override
  bool? get stringify => false;
}

Builder frameworkGeneratorBuilder(BuilderOptions options) => SharedPartBuilder(
      [MeeMFrameworkGenerator.instance],
      'meem_framework_generator',
      additionalOutputExtensions: [
        ".event.dart",
        ".exception.dart",
      ],
    );
