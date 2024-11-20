part of 'core.dart';

abstract class MeeMBaseBuildCoreException<T, V extends Object> extends Equatable
    implements Object, Exception {
  final String message;

  final ExceptionResult<T, V> result;

  const MeeMBaseBuildCoreException([
    this.message = 'An exception (MeeMBaseBuildCoreException) has occurred',
    this.result,
  ]);

  @override
  List<Object?> get props => [
        message,
        result,
      ];
}
