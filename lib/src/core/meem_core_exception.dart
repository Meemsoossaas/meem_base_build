part of 'core.dart';

abstract base class MeeMCoreException<T> extends Equatable {
  MeeMCoreException<T> get exception;

  @override
  List<Object?> get props => [];
}
