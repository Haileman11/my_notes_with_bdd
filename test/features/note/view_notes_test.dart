// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../step/injection_is_setup.dart';
import '../../step/clean_up_after_the_test.dart';
import '../../step/the_saved_notes_list_is_not_empty.dart';
import '../../step/the_app_is_running.dart';
import '../../step/i_see_widget.dart';
import '../../step/the_saved_notes_list_is_empty.dart';
import '../../step/i_dont_see_widget.dart';
import '../../step/i_see_text.dart';

void main() {
  Future<void> bddSetUp(WidgetTester tester) async {
    await injectionIsSetup(tester);
  }

  Future<void> bddTearDown(WidgetTester tester) async {
    await cleanUpAfterTheTest(tester);
  }

  group('''View notes''', () {
    testWidgets('''Should view the notes list when app is opened''',
        (tester) async {
      try {
        await bddSetUp(tester);
        await theSavedNotesListIsNotEmpty(tester);
        await theAppIsRunning(tester);
        await iSeeWidget(tester, ListView);
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets(
        '''Should see a message saying there are no saved notes if notes list is empty''',
        (tester) async {
      try {
        await bddSetUp(tester);
        await theSavedNotesListIsEmpty(tester);
        await theAppIsRunning(tester);
        await iDontSeeWidget(tester, ListView);
        await iSeeText(tester, 'You have no saved notes.');
      } finally {
        await bddTearDown(tester);
      }
    });
  });
}
