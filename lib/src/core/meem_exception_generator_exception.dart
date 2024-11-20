part of 'core.dart';

/// {@template meem}
///
///
///
/// {@endtemplate}
@immutable
final class MeeMExceptionGeneratorException<T, V extends Object> extends MeeMCodeGeneratorException<T, V> {
  const MeeMExceptionGeneratorException([
    super.message,
    super.result,
  ]);
}
