part of 'core.dart';

enum DartObjectType {
  classObject(keyword: 'class'),
  mixin(keyword: 'mixin'),
  enumeration(keyword: 'enum'),
  extensionType(keyword: 'extension type');

  final String keyword;

  const DartObjectType({
    required this.keyword,
  });
}
