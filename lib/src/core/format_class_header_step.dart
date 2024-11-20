part of 'core.dart';

enum FormatClassHeaderStep {
  prefix(),
  name(),
  declaredGenerics(),
  extendedClass(),
  mixins(),
  implementers();

  const FormatClassHeaderStep();
}
