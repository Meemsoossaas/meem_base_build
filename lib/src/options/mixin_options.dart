part of 'options.dart';

/// {@template meem}
///
///
///
/// {@endtemplate}
@immutable
final class MixinOptions extends MeeMBaseBuildOptions<MixinElement> {
  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  final ClassPrefixes? prefix;

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  final List<Type>? on;

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  final List<Type>? implements;

  const MixinOptions({
    required super.name,
    super.docDescription,
    this.on,
    this.implements,
    this.prefix,
  });

  @override
  List<Object?> get props =>
      [
        prefix,
        on,
        implements,
      ] +
      super.props;
}
