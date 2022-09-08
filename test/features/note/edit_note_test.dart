// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../step/injection_is_setup.dart';
import '../../step/clean_up_after_the_test.dart';
import '../../step/the_database_saves_the_note.dart';
import '../../step/the_app_is_on_page.dart';
import '../../step/i_see_text.dart';
import '../../step/i_enter_into_input_field.dart';
import '../../step/i_tap_icon.dart';
import '../../step/i_see_widget.dart';

void main() {
  Future<void> bddSetUp(WidgetTester tester) async {
    await injectionIsSetup(tester);
  }

  Future<void> bddTearDown(WidgetTester tester) async {
    await cleanUpAfterTheTest(tester);
  }

  group('''Edit Note''', () {
    testWidgets('''Should be able to edit note when title is valid''',
        (tester) async {
      try {
        await bddSetUp(tester);
        await theDatabaseSavesTheNote(tester);
        await theAppIsOnPage(tester, '/notes/note');
        await iSeeText(tester, 'Edit note');
        await iEnterIntoInputField(tester, "Shopping list", 0);
        await iEnterIntoInputField(tester, "battery, groceries", 1);
        await iTapIcon(tester, Icons.save);
        await iSeeWidget(tester, SnackBar);
        await iSeeText(tester, 'Saved successfully');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''Should not make changes to the new note if title is empty''',
        (tester) async {
      try {
        await bddSetUp(tester);
        await theAppIsOnPage(tester, '/notes/note');
        await iSeeText(tester, 'Edit note');
        await iEnterIntoInputField(tester, "", 0);
        await iTapIcon(tester, Icons.save);
        await iSeeText(tester, 'Title can not be empty');
      } finally {
        await bddTearDown(tester);
      }
    });
  });
}
