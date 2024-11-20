part of 'core.dart';

@immutable
abstract final class MeeMStringService {
  @internal
  static String formatList(List source) {
    final buffer = StringBuffer();
    for (int i = 0; i < source.length; i++) {
      buffer.write('${source[i]}${i == 0 || i == source.length - 1 ? '' : ','}');
    }
    return buffer.toString();
  }

  @internal
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
          normalBuffer.writeln(parameter.asParameter);
        }
      }
    }
    assert(
      !parameters.containsKey(ParameterType.optional) && !parameters.containsKey(ParameterType.mapped),
      'Optional and mapped parameters cannot be in a constructor',
    );
    if (parameters.containsKey(ParameterType.optional)) {
      optionalBuffer.writeln('[');
      final optionalIndexedParameters = parameters[ParameterType.normal];
      if (optionalIndexedParameters != null) {
        for (final parameter in optionalIndexedParameters) {
          optionalBuffer.writeln(parameter.asParameter);
        }
      }
      optionalBuffer.writeln(']');
    }
    if (parameters.containsKey(ParameterType.mapped)) {
      optionalBuffer.writeln('{');
      final mappedIndexedParameters = parameters[ParameterType.normal];
      if (mappedIndexedParameters != null) {
        for (final parameter in mappedIndexedParameters) {
          mappedBuffer.writeln(parameter.asParameter);
        }
      }
      optionalBuffer.writeln('}');
    }
    return (
      normalParameterResult: normalBuffer.toString(),
      optionalParameterResult: optionalBuffer.toString(),
      mappedParameterResult: mappedBuffer.toString(),
    );
  }

  static String _formatProperties(MeeMBaseBuildTemplates template, Parameters properties) {
    if (properties.isEmpty) return '';
    switch (template) {
      case MeeMBaseBuildTemplates.framework:
        final buffer = StringBuffer();
        properties.forEach((key, value) {
          switch (key) {
            case ParameterType.normal:
              final normalParameters = properties[ParameterType.normal] ?? [];
              for (final normalParameter in normalParameters) {
                buffer.writeln(normalParameter.asProperty);
              }
              break;
            case ParameterType.optional:
              break;
            case ParameterType.mapped:
              break;
          }
        });
        return buffer.toString();
    }
  }

  @internal
  static String toSnakeCase(String name) {
    final snakeCase = name
        .replaceAllMapped(
          RegExp(r'([a-z])([A-Z])'),
          (Match match) => '${match.group(1)}_${match.group(2)}',
        )
        .toLowerCase();

    return snakeCase;
  }

  @internal
  static String regainOriginalName(String className) {
    if (className.contains('Event')) {
      return className.replaceAll('Event', '');
    } else if (className.contains('Exception')) {
      return className.replaceAll('Exception', '');
    }
    throw Exception();
  }

  @internal
  static String formatPrefix({
    required ClassOptions options,
    required FrameObjectType objectType,
    MeeMBaseBuildTemplates template = MeeMBaseBuildTemplates.framework,
  }) {
    switch (template) {
      case MeeMBaseBuildTemplates.framework:
        return "part of '${regainOriginalName(options.name).toLowerCase()}.dart';";
    }
  }

  @internal
  static String formatAnnotation({
    required ClassOptions options,
    required FrameObjectType objectType,
    MeeMBaseBuildTemplates template = MeeMBaseBuildTemplates.framework,
  }) {
    final classAnnotation = options.classAnnotation;
    switch (template) {
      case MeeMBaseBuildTemplates.framework:
        return classAnnotation == immutable ? '@immutable' : classAnnotation.toString();
    }
  }

  static String _formatClassHeader({
    required ClassOptions options,
    required FrameObjectType objectType,
    required FormatClassHeaderStep step,
    MeeMBaseBuildTemplates template = MeeMBaseBuildTemplates.framework,
  }) {
    switch (template) {
      case MeeMBaseBuildTemplates.framework:
        switch (step) {
          case FormatClassHeaderStep.prefix:
            return '${options.prefixes?.combine ?? 'class'} ';
          case FormatClassHeaderStep.name:
            return options.name;
          case FormatClassHeaderStep.declaredGenerics:
            switch (objectType) {
              case FrameObjectType.event:
                return '<T extends Object> ';
              case FrameObjectType.exception:
                return '<T> ';
            }
          case FormatClassHeaderStep.extendedClass:
            switch (objectType) {
              case FrameObjectType.event:
                return 'extends MeeMCoreEvent<T> ';
              case FrameObjectType.exception:
                return 'extends MeeMCoreException<T> ';
            }
          default:
            return '';
        }
    }
  }

  @internal
  static String formatClassHeader({
    required ClassOptions options,
    required FrameObjectType objectType,
    MeeMBaseBuildTemplates template = MeeMBaseBuildTemplates.framework,
  }) {
    switch (template) {
      case MeeMBaseBuildTemplates.framework:
        final buffer = StringBuffer();
        buffer.write(
          _formatClassHeader(
            options: options,
            objectType: objectType,
            step: FormatClassHeaderStep.prefix,
            template: template,
          ),
        );
        buffer.write(
          _formatClassHeader(
            options: options,
            objectType: objectType,
            step: FormatClassHeaderStep.name,
            template: template,
          ),
        );
        buffer.write(
          _formatClassHeader(
            options: options,
            objectType: objectType,
            step: FormatClassHeaderStep.declaredGenerics,
            template: template,
          ),
        );
        buffer.write(
          _formatClassHeader(
            options: options,
            objectType: objectType,
            step: FormatClassHeaderStep.extendedClass,
            template: template,
          ),
        );
        buffer.write(
          _formatClassHeader(
            options: options,
            objectType: objectType,
            step: FormatClassHeaderStep.mixins,
            template: template,
          ),
        );
        buffer.write(
          _formatClassHeader(
            options: options,
            objectType: objectType,
            step: FormatClassHeaderStep.implementers,
            template: template,
          ),
        );
        buffer.write(' {');
        return buffer.toString();
    }
  }

  @internal
  static String formatProperties({
    required ClassOptions options,
    required FrameObjectType objectType,
    MeeMBaseBuildTemplates template = MeeMBaseBuildTemplates.framework,
  }) {
    switch (template) {
      case MeeMBaseBuildTemplates.framework:
        return _formatProperties(
          template,
          options.parameters,
        );
    }
  }

  static String _formatConstructor({
    required ClassOptions options,
    required FrameObjectType objectType,
    required FormatClassConstructorStep step,
    MeeMBaseBuildTemplates template = MeeMBaseBuildTemplates.framework,
  }) {
    switch (template) {
      case MeeMBaseBuildTemplates.framework:
        switch (step) {
          case FormatClassConstructorStep.constructorName:
            return '\t${options.name}';
          case FormatClassConstructorStep.parameters:
            final buffer = StringBuffer();
            final paramsResult = classParameterLineBreak(options.parameters);
            buffer.write('(');
            if (paramsResult.normalParameterResult.isEmpty &&
                paramsResult.optionalParameterResult.isEmpty &&
                paramsResult.mappedParameterResult.isEmpty) {
              buffer.writeln(');');
              return buffer.toString();
            }
            if (paramsResult.normalParameterResult.isNotEmpty) {
              buffer.writeln(paramsResult.normalParameterResult);
            }
            if (paramsResult.optionalParameterResult.isNotEmpty) {
              buffer.writeln(paramsResult.optionalParameterResult);
            }
            if (paramsResult.mappedParameterResult.isNotEmpty) {
              buffer.writeln(paramsResult.mappedParameterResult);
            }
            buffer.writeln(');');
            return buffer.toString();
          default:
            return '';
        }
    }
  }

  @internal
  static String formatConstructor({
    required ClassOptions options,
    required FrameObjectType objectType,
    MeeMBaseBuildTemplates template = MeeMBaseBuildTemplates.framework,
  }) {
    switch (template) {
      case MeeMBaseBuildTemplates.framework:
        final buffer = StringBuffer();
        buffer.write(
          _formatConstructor(
            options: options,
            objectType: objectType,
            step: FormatClassConstructorStep.constructorPrefix,
            template: template,
          ),
        );
        buffer.write(
          _formatConstructor(
            options: options,
            objectType: objectType,
            step: FormatClassConstructorStep.constructorName,
            template: template,
          ),
        );
        buffer.write(
          _formatConstructor(
            options: options,
            objectType: objectType,
            step: FormatClassConstructorStep.parameters,
            template: template,
          ),
        );
        buffer.write(
          _formatConstructor(
            options: options,
            objectType: objectType,
            step: FormatClassConstructorStep.postInitializing,
            template: template,
          ),
        );
        buffer.write(
          _formatConstructor(
            options: options,
            objectType: objectType,
            step: FormatClassConstructorStep.assertion,
            template: template,
          ),
        );
        return buffer.toString();
    }
  }

  @internal
  static String formatOverrides({
    required ClassOptions options,
    required FrameObjectType objectType,
    MeeMBaseBuildTemplates template = MeeMBaseBuildTemplates.framework,
  }) {
    switch (template) {
      case MeeMBaseBuildTemplates.framework:
        if (options.template == MeeMBaseBuildTemplates.framework) {
          final buffer = StringBuffer();
          final exceptionClassName =
              options.name.contains('Event') ? options.name.replaceFirst('Event', 'Exception') : options.name;
          buffer.writeln('\t@override');
          buffer.writeln(
            '\tMeeMCoreException<${options.generics[0].identifier}> get exception => $exceptionClassName();',
          );
          return buffer.toString();
        } else {
          throw Exception();
        }
    }
  }

  @internal
  static String classFormatProcess({
    required ClassOptions options,
    required FrameObjectType objectType,
    MeeMBaseBuildTemplates template = MeeMBaseBuildTemplates.framework,
  }) {
    final classFormatBuffer = StringBuffer();
    classFormatBuffer.writeln(
      formatPrefix(
        options: options,
        objectType: objectType,
        template: template,
      ),
    );
    classFormatBuffer.writeln();
    classFormatBuffer.writeln(
      formatAnnotation(
        options: options,
        objectType: objectType,
        template: template,
      ),
    );
    classFormatBuffer.writeln(
      formatClassHeader(
        options: options,
        objectType: objectType,
        template: template,
      ),
    );
    if (options.parameters.isNotEmpty) {
      classFormatBuffer.writeln(
        formatProperties(
          options: options,
          objectType: objectType,
          template: template,
        ),
      );
    }
    classFormatBuffer.writeln(
      formatConstructor(
        options: options,
        objectType: objectType,
        template: template,
      ),
    );
    classFormatBuffer.write(
      formatOverrides(
        options: options,
        objectType: objectType,
        template: template,
      ),
    );
    classFormatBuffer.writeln('}');
    return classFormatBuffer.toString();
  }

  static String fulfillClassTemplate({
    required ClassOptions options,
    required FrameObjectType objectType,
    MeeMBaseBuildTemplates template = MeeMBaseBuildTemplates.framework,
  }) {
    switch (template) {
      case MeeMBaseBuildTemplates.framework:
        return classFormatProcess(
          options: options,
          objectType: objectType,
          template: template,
        );
    }
  }
}
