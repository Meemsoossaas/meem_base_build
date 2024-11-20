part of 'core.dart';

/// {@template meem}
///
///
///
/// {@endtemplate}
@immutable
base class MeeMCodeGeneratorException<T, V extends Object> extends MeeMCoreGeneratorException<T, V> {
  const MeeMCodeGeneratorException([
    super.message,
    super.result,
  ]);
}
