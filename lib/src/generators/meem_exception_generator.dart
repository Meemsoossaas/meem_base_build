import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:meem_base_build/annotation.dart';
import 'package:meta/meta.dart';
import 'package:source_gen/source_gen.dart';

@immutable
final class MeeMExceptionGenerator extends GeneratorForAnnotation<MeeMExceptionBuild> {
  static const MeeMExceptionGenerator instance = MeeMExceptionGenerator._();

  const MeeMExceptionGenerator._();

  factory MeeMExceptionGenerator() => instance;

  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    // TODO: implement generateForAnnotatedElement
    throw UnimplementedError();
  }
}

Builder exceptionGeneratorBuilder(BuilderOptions options) =>
    SharedPartBuilder([MeeMExceptionGenerator.instance], 'meem_exception_generator',
        additionalOutputExtensions: [
          ".exception.dart",
        ]);
