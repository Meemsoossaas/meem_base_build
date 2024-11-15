part of 'generators.dart';

@immutable
final class MeeMFrameworkGenerator extends GeneratorForAnnotation<MeeMFrameworkGeneratorException>
    implements MeeMCodeGenerator {
  static const MeeMFrameworkGenerator instance = MeeMFrameworkGenerator._();

  const MeeMFrameworkGenerator._();

  factory MeeMFrameworkGenerator() => instance;

  @internal
  @override
  Future<void> generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) async {
    if (element is! ClassElement) throw MeeMFrameworkGeneratorException();
    final className = element.name;
  }

  @internal
  Builder frameworkGeneratorBuilder(BuilderOptions options) => SharedPartBuilder(
        [MeeMExceptionGenerator.instance],
        'meem_framework_generator',
      );

  @override
  List<Object?> get props => List.empty();

  @override
  bool? get stringify => false;
}
