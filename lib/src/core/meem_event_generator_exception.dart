part of 'core.dart';

@immutable
final class MeeMEventGeneratorException<T, V extends Object> extends MeeMCodeGeneratorException<T, V> {
  const MeeMEventGeneratorException([
    super.message,
    super.result,
  ]);
}