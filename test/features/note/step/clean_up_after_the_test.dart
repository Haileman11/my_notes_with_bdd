import 'package:flutter_test/flutter_test.dart';
import 'package:my_notes/injection_container.dart';

Future<void> cleanUpAfterTheTest(WidgetTester tester) async {
  sl.reset();
}
