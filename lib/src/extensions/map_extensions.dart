part of 'extensions.dart';

/// {@template meem}
///
///
///
/// {@endtemplate}
extension MapExtensions<K, V> on Map<K, V> {
  /// {@template meem}
  ///
  ///
  ///
  /// {@endtemplate}
  ClassOptions toEventClassOptions(MeeMBaseBuildTemplates template) {
    switch (template) {
      case MeeMBaseBuildTemplates.framework:
        return ClassOptions.framework(
          name: this['name'] as String,
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
