// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../step/injection_is_setup.dart';
import '../../step/clean_up_after_the_test.dart';
import '../../step/the_saved_notes_list_is_not_empty.dart';
import '../../step/the_app_is_on_page.dart';
import '../../step/i_tap_icon.dart';
import '../../step/i_see_widget.dart';

void main() {
  Future<void> bddSetUp(WidgetTester tester) async {
    await injectionIsSetup(tester);
  }

  Future<void> bddTearDown(WidgetTester tester) async {
    await cleanUpAfterTheTest(tester);
  }

  group('''Delete note''', () {
    testWidgets('''Should see a confirmation dialog when delete is pressed''',
        (tester) async {
      try {
        await bddSetUp(tester);
        await theSavedNotesListIsNotEmpty(tester);
        await theAppIsOnPage(tester, '/notes/note');
        await iTapIcon(tester, Icons.delete);
        await iSeeWidget(tester, AlertDialog);
      } finally {
        await bddTearDown(tester);
      }
    });
  });
}
