part of 'generators.dart';

@immutable
abstract interface class MeeMCoreGenerator extends Equatable implements Object {
  @internal
  static const bool generatorsAreSingleton = true;

  const MeeMCoreGenerator();

  @override
  List<Object?> get props => List.empty();
}
