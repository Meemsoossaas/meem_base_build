part of 'generators.dart';

@immutable
final class MeeMExceptionGenerator extends GeneratorForAnnotation<MeeMExceptionGeneratorException> {
  static const MeeMExceptionGenerator instance = MeeMExceptionGenerator._();

  const MeeMExceptionGenerator._();

  factory MeeMExceptionGenerator() => instance;

  @internal
  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    // TODO: implement generateForAnnotatedElement
    throw UnimplementedError();
  }

  @internal
  Builder exceptionGeneratorBuilder(BuilderOptions options) => SharedPartBuilder(
        [MeeMExceptionGenerator.instance],
        'meem_exception_generator',
      );
}
