part of 'core.dart';

abstract final class MeeMStringService {
  static String lineBreak<T extends Iterable>(
    T reference, [
    String splitter = ',',
  ]) {
    final buffer = StringBuffer();
    if (reference is Parameters) {
      final split = (reference as Parameters).toString().replaceAll('[', '').replaceAll(']', '').trim().split(splitter);
      for (final referencePoint in split) {
        buffer.write('\n');
      }
    }
    return buffer.toString();
  }

  static BufferParameterResult classParameterLineBreak(
    Parameters parameters, [
    String splitter = ',',
  ]) {
    final normalBuffer = StringBuffer();
    final optionalBuffer = StringBuffer();
    final mappedBuffer = StringBuffer();
    if (parameters.containsKey(ParameterType.normal)) {
      final normalIndexedParameters = parameters[ParameterType.normal];
      if (normalIndexedParameters != null) {
        for (final parameter in normalIndexedParameters) {
          normalBuffer.writeln('${parameter.type.toString()}${parameter.nullable ? '?' : ''} ${parameter.name},');
        }
      }
    }
    assert(
      !parameters.containsKey(ParameterType.optional) && !parameters.containsKey(ParameterType.mapped),
      'Optional and mapped parameters cannot be in a constructor',
    );
    if (parameters.containsKey(ParameterType.optional)) {
      final optionalIndexedParameters = parameters[ParameterType.normal];
      if (optionalIndexedParameters != null) {
        for (final parameter in optionalIndexedParameters) {
          optionalBuffer.writeln(
              '${parameter.type.toString()}${parameter.nullable ? '?' : ''} ${parameter.name}${parameter.defaultValue != null ? ' = ${parameter.defaultValue!}' : ''},');
        }
      }
    }
    if (parameters.containsKey(ParameterType.mapped)) {
      final mappedIndexedParameters = parameters[ParameterType.normal];
      if (mappedIndexedParameters != null) {
        for (final parameter in mappedIndexedParameters) {
          mappedBuffer.writeln(
              '${parameter.required ? 'required ' : ''}${parameter.type.toString()}${parameter.nullable ? '?' : ''} ${parameter.name}${parameter.defaultValue != null ? ' = ${parameter.defaultValue!}' : ''},');
        }
      }
    }
    return (
      normalParameterResult: normalBuffer.toString(),
      optionalParameterResult: optionalBuffer.toString(),
      mappedParameterResult: mappedBuffer.toString(),
    );
  }

  static String toSnakeCase(String name) {
    final snakeCase = name
        .replaceAllMapped(
          RegExp(r'([a-z])([A-Z])'),
          (Match match) => '${match.group(1)}_${match.group(2)}',
        )
        .toLowerCase();

    return snakeCase;
  }

  static String fulfillTemplate<E extends MeeMBaseBuildOptions>({
    required String name,
    required E options,
  }) {
    // TODO: implement fulFillTemplate
    throw UnimplementedError();
  }

  static String fulfillClassTemplate({
    required String name,
    required ClassOptions options,
  }) {
    final parameterResult = options.parameters != null ? classParameterLineBreak(options.parameters!) : null;
    return '''
    ${options.docDescription != null ? '''
    /// {@template ${toSnakeCase(name)}
    ${options.docDescription!}
    /// {@endtemplate}
    ''' : ''}
    @immutable
    ${options.prefixes?.combine ?? 'class'} $name ${options.extendedClass != null ? 'extends ${options.extendedClass!.toString()}' : ''} ${options.mixins != null ? 'with ${options.mixins!.toString()
          ..replaceAll('[', '')
          ..replaceAll(']', '')
          ..trim()}' : ''} ${options.implements != null ? 'implements ${options.implements!.toString()
          ..replaceAll('[', '')
          ..replaceAll(']', '')
          ..trim()}' : ''} {
        ${options.hasConstructor ? '''
        ${options.constantConstructor ?? true ? options.parameters != null ? '''
        const $name(
          ${parameterResult?.normalParameterResult ?? ''}
          ${parameterResult != null && parameterResult.optionalParameterResult.isNotEmpty ? '''[
          ${parameterResult.optionalParameterResult}
          ]''' : ''}
          ${parameterResult != null && parameterResult.mappedParameterResult.isNotEmpty ? '''{
          ${parameterResult.mappedParameterResult}
          }''' : ''}
        );
        ''' : 'const $name();' : options.parameters != null ? '''
        $name(
          ${parameterResult?.normalParameterResult ?? ''}
          ${parameterResult != null && parameterResult.optionalParameterResult.isNotEmpty ? '''[
          ${parameterResult.optionalParameterResult}
          ]''' : ''}
          ${parameterResult != null && parameterResult.mappedParameterResult.isNotEmpty ? '''{
          ${parameterResult.mappedParameterResult}
          }''' : ''}
        )
        ''' : '$name();'}
        ''' : ''}
    }
    ''';
  }
}
