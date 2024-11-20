part of 'options.dart';

@immutable
sealed class MeeMBaseBuildOptions<E extends Element> extends Equatable
    implements Object {
  final String name;

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
