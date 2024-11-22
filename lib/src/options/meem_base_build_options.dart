part of 'options.dart';

/// {@template meem_base_build_options}
///
/// A class which serves as a basis for user customizability for their specific wants.
/// A [MeeMCoreGenerator] can then consider the users input (via this).
///
/// {@endtemplate}
@internal
sealed class MeeMBaseBuildOptions<E extends Element> extends Equatable implements Object {
  /// {@template meem_base_build_options_name}
  ///
  /// The name of the class.
  ///
  /// {@endtemplate}
  final String name;

  /// {@template meem_base_build_options_doc_description}
  ///
  /// A description for this.
  /// At the moment, a [MeeMCoreGenerator] will ignore this information.
  ///
  /// {@endtemplate}
  final String? docDescription;

  /// {@macro meem_base_build_options}
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
