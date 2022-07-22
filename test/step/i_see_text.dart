import 'package:flutter_test/flutter_test.dart';

/// Example: When I see {'text'} text
Future<void> iSeeText(
  WidgetTester tester,
  String text,
) async {
  await tester.pumpAndSettle();
  expect(find.text(text), findsOneWidget);
}
