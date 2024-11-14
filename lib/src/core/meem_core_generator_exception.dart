part of 'core.dart';

@immutable
abstract base class MeeMCoreGeneratorException<T, V extends Object> extends MeeMBaseBuildCoreException<T, V> {
  const MeeMCoreGeneratorException([
    super.message,
    super.result,
  ]);
}
