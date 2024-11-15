part of 'core.dart';

@immutable
abstract final class MeeMStringService {
  static String formatList(List source) {
    final sourceAsString = source.toString();
    return sourceAsString
      ..replaceAll('[', '')
      ..replaceAll(']', '')
      ..trim();
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
          normalBuffer.writeln(
            '${parameter.type.toString()}${parameter.nullable ? '?' : ''} ${parameter.name},',
          );
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
            '${parameter.type.toString()}${parameter.nullable ? '?' : ''} ${parameter.name}${parameter.defaultValue != null ? ' = ${parameter.defaultValue!}' : ''},',
          );
        }
      }
    }
    if (parameters.containsKey(ParameterType.mapped)) {
      final mappedIndexedParameters = parameters[ParameterType.normal];
      if (mappedIndexedParameters != null) {
        for (final parameter in mappedIndexedParameters) {
          mappedBuffer.writeln(
            '${parameter.required ? 'required ' : ''}${parameter.type.toString()}${parameter.nullable ? '?' : ''} ${parameter.name}${parameter.defaultValue != null ? ' = ${parameter.defaultValue!}' : ''},',
          );
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

  static String formatGenerics(List<Generic>? source) {}

  static String fulfillClassTemplate({
    required String name,
    required ClassOptions options,
    MeeMBaseBuildTemplates? template,
  }) {
    final classTemplateBuffer = StringBuffer();
    final parameterResult = options.parameters != null ? classParameterLineBreak(options.parameters!) : null;
    switch (template) {
      case MeeMBaseBuildTemplates.framework:
        classTemplateBuffer.writeln('@immutable');
        classTemplateBuffer.writeln(
          '${MeeMFrameworkValidationService.validatePrefix(options.prefixes?.combine ?? 'class')} $name${MeeMStringService.formatGenerics(options.generics)}} ${options.extendedClass != null ? 'extends ${options.extendedClass!.toString()}' : ''} ${options.mixins != null ? 'with ${MeeMStringService.formatList(options.mixins!)}' : ''} ${options.implements != null ? 'implements ${MeeMStringService.formatList(options.implements!)}' : ''} {',
        );
        return classTemplateBuffer.toString();
      default:
        classTemplateBuffer.writeln('@immutable');
        classTemplateBuffer.writeln(
          '${options.prefixes?.combine ?? 'class'} $name${options.generics != null ? '<${MeeMStringService.formatList(options.generics!)}>' : ''} ${options.extendedClass != null ? 'extends ${options.extendedClass!.toString()}' : ''} ${options.mixins != null ? 'with ${MeeMStringService.formatList(options.mixins!)}' : ''} ${options.implements != null ? 'implements ${MeeMStringService.formatList(options.implements!)}' : ''} {',
        );
        classTemplateBuffer.writeln('''
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
    ''');
        classTemplateBuffer.writeln('}');
        return classTemplateBuffer.toString();
    }
  }
}
