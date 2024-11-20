part of 'generators.dart';

@immutable
abstract interface class MeeMCodeGenerator extends MeeMCoreGenerator {
  const MeeMCodeGenerator();

  bool get isSingleton;
}
