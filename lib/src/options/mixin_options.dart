part of 'options.dart';

@immutable
final class MixinOptions extends MeeMBaseBuildOptions<MixinElement> {
  final ClassPrefixes? prefix;
  final List<Type>? on;
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
