part of 'core.dart';

enum FormatClassConstructorStep {
  constructorPrefix(),
  constructorName(),
  parameters(),
  postInitializing(),
  assertion();

  const FormatClassConstructorStep();
}
