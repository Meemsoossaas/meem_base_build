part of 'test.dart';

@immutable
base class TestEvent<T extends Object> extends MeeMCoreEvent<T>  {
	TestEvent();

	@override
	MeeMCoreException<T> get exception => TestException();
}
