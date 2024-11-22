part of 'core.dart';

/// {@template meem_code_generator_exception}
///
/// An exception which represents a general exception in a [MeeMCodeGenerator].
///
/// {@endtemplate}
@immutable
base class MeeMCodeGeneratorException<T, V extends Object> extends MeeMCoreGeneratorException<T, V> {
  /// {@macro meem_code_generator_exception}
  const MeeMCodeGeneratorException([
    super.message,
    super.result,
  ]);
}
