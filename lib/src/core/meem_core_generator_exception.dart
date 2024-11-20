part of 'core.dart';

/// {@template meem}
///
///
///
/// {@endtemplate}
@immutable
abstract base class MeeMCoreGeneratorException<T, V extends Object> extends MeeMBaseBuildCoreException<T, V> {
  const MeeMCoreGeneratorException([
    super.message,
    super.result,
  ]);
}
