part of 'extensions.dart';

extension StringBufferExtensions on StringBuffer {
  void writeWithEmptySpace(Object? content) {
    write(content);
    write(' ');
  }
}
