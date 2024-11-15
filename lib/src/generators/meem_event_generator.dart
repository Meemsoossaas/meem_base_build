part of 'generators.dart';

@immutable
final class MeeMEventGenerator extends GeneratorForAnnotation<MeeMEventGeneratorException>
    implements MeeMCodeGenerator {
  static const MeeMEventGenerator instance = MeeMEventGenerator._();

  const MeeMEventGenerator._();

  factory MeeMEventGenerator() => instance;

  @internal
  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    // TODO: implement generateForAnnotatedElement
    throw UnimplementedError();
  }

  @internal
  Builder eventGeneratorBuilder(BuilderOptions options) => SharedPartBuilder(
        [MeeMEventGenerator.instance],
        'meem_event_generator',
      );

  @override
  List<Object?> get props => List.empty();

  @override
  bool? get stringify => false;
}
