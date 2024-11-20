part of 'test.dart';

@immutable
base class TestException<T> extends MeeMCoreException<T>  {
	TestException();

	@override
	MeeMCoreException<T> get exception => TestException();
}
