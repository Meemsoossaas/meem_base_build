import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:meta/meta.dart' show immutable;
import 'package:source_gen/source_gen.dart';

import '../../meem_base_build.dart';

@immutable
final class MeeMEventGenerator extends GeneratorForAnnotation<MeeMEventBuild> implements MeeMCodeGenerator {
  static const MeeMEventGenerator instance = MeeMEventGenerator._();

  const MeeMEventGenerator._();

  factory MeeMEventGenerator() => instance;

  @override
  Future<void> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    if (element is! ClassElement) throw MeeMEventGeneratorException();
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
  }

  @override
  List<Object?> get props => List.empty();

  @override
  bool? get stringify => false;

  @override
  bool get isSingleton => true;
}

Builder eventGeneratorBuilder(BuilderOptions options) => SharedPartBuilder(
      [MeeMEventGenerator.instance],
      'meem_event_generator',
      additionalOutputExtensions: ['.event.dart'],
    );
