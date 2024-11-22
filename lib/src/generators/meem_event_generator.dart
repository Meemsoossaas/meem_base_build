import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:meta/meta.dart' show protected;
import 'package:source_gen/source_gen.dart';

import '../../meem_base_build.dart';

/// {@template meem_event_generator}
///
/// The code generator for event classes which are based on [MeeMCoreEvent].
///
/// {@endtemplate}
@protected
final class MeeMEventGenerator extends GeneratorForAnnotation<MeeMEventBuild> implements MeeMCodeGenerator {
  /// {@macro meem_event_generator}
  static const MeeMEventGenerator instance = MeeMEventGenerator._();

  @protected
  const MeeMEventGenerator._();

  /// {@macro meem_event_generator}
  factory MeeMEventGenerator() => instance;

  @override
  Future<void> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async =>
      await _generateForAnnotatedElement(
        element,
        annotation,
        buildStep,
      );

  @protected
  Future<void> _generateForAnnotatedElement(
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
  bool get isSingleton => MeeMCoreGenerator.generatorsAreSingleton;

  @override
  List<Object?> get props => List.empty();

  @override
  bool? get stringify => false;
}

/// {@template meem_event_generator_event_generator_Builder}
///
/// The affiliated builder for [MeeMEventGenerator].
///
/// {@endtemplate}
@protected
Builder eventGeneratorBuilder(BuilderOptions options) => _eventGeneratorBuilder(options);

@protected
Builder _eventGeneratorBuilder(BuilderOptions _) => SharedPartBuilder(
      [MeeMEventGenerator.instance],
      'meem_event_generator',
      additionalOutputExtensions: ['.event.dart'],
    );
