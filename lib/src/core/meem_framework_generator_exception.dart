part of 'core.dart';

/// {@template meem_framework_generator_exception}
///
/// An exception which handles problems in [MeeMFrameworkGenerator].
///
/// {@endtemplate}
@immutable
final class MeeMFrameworkGeneratorException<T, V extends Object> extends MeeMCodeGeneratorException<T, V> {
  /// {@macro meem_framework_generator_exception}
  const MeeMFrameworkGeneratorException([
    super.message,
    super.result,
  ]);
}
