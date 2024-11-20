part of 'core.dart';

/// {@template meem}
///
///
///
/// {@endtemplate}
@immutable
final class MeeMFrameworkGeneratorException<T, V extends Object> extends MeeMCodeGeneratorException<T, V> {
  const MeeMFrameworkGeneratorException([
    super.message,
    super.result,
  ]);
}
