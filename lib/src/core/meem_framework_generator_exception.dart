part of 'core.dart';

final class MeeMFrameworkGeneratorException<T, V extends Object>
    extends MeeMCodeGeneratorException<T, V> {
  const MeeMFrameworkGeneratorException([
    super.message,
    super.result,
  ]);
}
