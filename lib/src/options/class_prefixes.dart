part of 'options.dart';

enum ClassPrefixes {
  base(syntax: 'base'),
  interface(syntax: 'interface'),
  finalized(syntax: 'final'),
  sealed(syntax: 'sealed'),
  abstract(syntax: 'abstract'),
  abstractBase(syntax: 'abstract base'),
  abstractInterface(syntax: 'abstract interface'),
  abstractFinal(syntax: 'abstract final');

  final String syntax;

  const ClassPrefixes({
    required this.syntax,
  });

  String get combine => '$syntax class';
}
