part of 'generators.dart';

/// {@template meem_code_generator}
///
/// An interface which sets scope functionality to be implemented for code generation.
///
/// {@endtemplate}
@internal
abstract interface class MeeMCodeGenerator extends MeeMCoreGenerator {
  /// {@macro meem_code_generator}
  const MeeMCodeGenerator();

  /// {@template meem_code_generator_is_singleton}
  ///
  /// Confirms if the code generator is a singleton.
  /// This can be as basic as returning [true] or [false].
  ///
  /// {@endtemplate}
  bool get isSingleton;
}
