import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:meem_base_build/annotation.dart';
import 'package:meta/meta.dart' show immutable;
import 'package:source_gen/source_gen.dart';

import '../../generators.dart';

@immutable
final class MeeMEventGenerator extends GeneratorForAnnotation<MeeMEventBuild> implements MeeMCodeGenerator {
  static const MeeMEventGenerator instance = MeeMEventGenerator._();

  const MeeMEventGenerator._();

  factory MeeMEventGenerator() => instance;

  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    // TODO: implement generateForAnnotatedElement
    throw UnimplementedError();
  }

  Builder eventGeneratorBuilder(BuilderOptions options) =>
      SharedPartBuilder([MeeMEventGenerator.instance], 'meem_event_generator',
          additionalOutputExtensions: ['.event.dart']);

  @override
  List<Object?> get props => List.empty();

  @override
  bool? get stringify => false;
}
