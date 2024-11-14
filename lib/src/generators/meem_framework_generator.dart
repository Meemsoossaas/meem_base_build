part of 'generators.dart';

@immutable
final class MeeMFrameworkGenerator extends GeneratorForAnnotation<MeeMFrameworkGeneratorException>
    implements MeeMCodeGenerator {
  static const MeeMFrameworkGenerator instance = MeeMFrameworkGenerator._();

  const MeeMFrameworkGenerator._();

  factory MeeMFrameworkGenerator() => instance;

  @override
  dynamic generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is! ClassElement) return;
    final className = element.displayName;
  }

  @override
  List<Object?> get props => List.empty();

  @override
  bool? get stringify => false;
}
