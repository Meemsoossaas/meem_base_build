part of 'generators.dart';

/// {@template meem_core_generator}
///
/// An interface which serves as the basis for general generators.
///
/// {@endtemplate}
@internal
abstract interface class MeeMCoreGenerator extends Equatable implements Object {
  /// {@template meem_core_generator_generators_are_singleton}
  ///
  /// Internally declares the singleton status of all generators.
  ///
  /// {@endtemplate}
  @internal
  static const bool generatorsAreSingleton = true;

  /// {@macro meem_core_generator}
  const MeeMCoreGenerator();

  @override
  List<Object?> get props => List.empty();
}
