import 'package:meem_base_build/src/core/core.dart';
import 'package:meta/meta.dart';

import '../annotation.dart';

part 'test.event.dart';
part 'test.exception.dart';

@meem
final class Test<T extends Object> extends MeeMCore<TestEvent<T>, TestException<T>> {
  Test();

  @override
  TestException<T> get exception => TestException();
}
