part of 'options.dart';

/// {@template meem}
///
///
///
/// {@endtemplate}
@protected
sealed class MeeMBaseBuildOptions<E extends Element> extends Equatable implements Object {
  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  final String name;

  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  final String? docDescription;

  const MeeMBaseBuildOptions({
    required this.name,
    this.docDescription,
  });

  @override
  List<Object?> get props => [
        name,
        docDescription,
      ];
}
