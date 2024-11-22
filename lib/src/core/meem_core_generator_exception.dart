part of 'core.dart';

/// {@template meem_core_generator_exception}
///
/// An exception which serves as a base for all possible code generating exceptions.
///
/// {@endtemplate}
@immutable
abstract base class MeeMCoreGeneratorException<T, V extends Object> extends MeeMBaseBuildCoreException<T, V> {
  /// {@macro meem_core_generator_exception}
  const MeeMCoreGeneratorException([
    super.message,
    super.result,
  ]);
}
