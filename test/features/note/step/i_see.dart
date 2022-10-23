import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iSee(WidgetTester tester, String string) async {
  const key = Key("NOTES_LIST");
  expect(find.byKey(key), findsOneWidget);
}
