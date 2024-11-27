part of 'extensions.dart';

/// {@template map_extensions}
///
/// Extensions on [Map] to form thr functionality of this API.
///
/// {@endtemplate}
extension MapExtensions<K, V> on Map<K, V> {
  /// {@template map_extensions_to_event_class_options}
  ///
  /// Allows this to be converted into [ClassOptions] based on [template].
  ///
  /// {@endtemplate}
  ClassOptions toClassOptions(MeeMBaseBuildTemplates template) {
    switch (template) {
      case MeeMBaseBuildTemplates.framework:
        return ClassOptions.framework(
          name: this['name'] as String? ?? '',
          docDescription: this['docDescription'] as String?,
          prefixes: this['prefixes'] as ClassPrefixes?,
          implements: this['implements'] as List<Type>?,
          mixins: this['mixins'] as List<Type>?,
          hasConstructor: this['hasConstructor'] as bool,
          parameters: this['parameters'] as Parameters,
          frontFrameworkGenerics: this['frontFrameworkGenerics'] as bool,
          getters: this['getters'] as GetterSetterProperties,
        );
    }
  }
}
