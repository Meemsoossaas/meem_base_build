part of 'core.dart';

abstract base class MeeMCoreEvent<T extends Object> extends Equatable {
  MeeMCoreException<T> get exception;

  @override
  List<Object?> get props => [];
}
