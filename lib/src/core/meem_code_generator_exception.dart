part of 'core.dart';

@immutable
base class MeeMCodeGeneratorException<T, V extends Object>
    extends MeeMCoreGeneratorException<T, V> {
  const MeeMCodeGeneratorException([
    super.message,
    super.result,
  ]);
}
