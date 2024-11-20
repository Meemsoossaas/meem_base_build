part of 'core.dart';

/// {@template meem}
///
///
///
/// {@endtemplate}
@protected
abstract base class MeeMCoreException<T> extends Equatable {
  MeeMCoreException<T> get exception;

  @override
  List<Object?> get props => [];
}
