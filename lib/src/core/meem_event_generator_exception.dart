part of 'core.dart';

/// {@template meem_event_generator_exception}
///
/// An exception which handles problems in [MeeMEventGenerator].
///
/// {@endtemplate}
@immutable
final class MeeMEventGeneratorException<T, V extends Object> extends MeeMCodeGeneratorException<T, V> {
  /// {@macro meem_event_generator_exception}
  const MeeMEventGeneratorException([
    super.message,
    super.result,
  ]);
}
