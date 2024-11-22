part of 'core.dart';

/// {@template meem_exception_generator_exception}
///
/// An exception which handles problems in [MeeMExceptionGenerator].
///
/// {@endtemplate}
@immutable
final class MeeMExceptionGeneratorException<T, V extends Object> extends MeeMCodeGeneratorException<T, V> {
  /// {@macro meem_exception_generator_exception}
  const MeeMExceptionGeneratorException([
    super.message,
    super.result,
  ]);
}
