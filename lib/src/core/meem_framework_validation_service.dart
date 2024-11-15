part of 'core.dart';

@immutable
abstract final class MeeMFrameworkValidationService {
  static String validatePrefix(String source) {
    if (source.contains('abstract base') ||
        source.contains('base') ||
        source.contains('sealed') ||
        source.contains('final') ||
        source.contains('abstract final')) {
      return source;
    }
    throw Exception();
  }
}
