// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../step/injection_is_setup.dart';
import '../../step/clean_up_after_the_test.dart';
import '../../step/the_database_saves_the_note.dart';
import '../../step/the_app_is_on_page.dart';
import '../../step/i_enter_into_input_field.dart';
import '../../step/i_tap_icon.dart';
import '../../step/i_see_widget.dart';
import '../../step/i_see_text.dart';

void main() {
  Future<void> bddSetUp(WidgetTester tester) async {
    await injectionIsSetup(tester);
  }

  Future<void> bddTearDown(WidgetTester tester) async {
    await cleanUpAfterTheTest(tester);
  }

  group('''Create Note''', () {
    testWidgets('''Should show a success message when given valid title''',
        (tester) async {
      try {
        await bddSetUp(tester);
        await theDatabaseSavesTheNote(tester);
        await theAppIsOnPage(tester, '/notes/new_note');
        await iEnterIntoInputField(tester, "Shopping list", 0);
        await iEnterIntoInputField(tester, "battery, groceries", 1);
        await iTapIcon(tester, Icons.save);
        await iSeeWidget(tester, SnackBar);
        await iSeeText(tester, 'Saved successfully');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''Should display error when title is empty''', (tester) async {
      try {
        await bddSetUp(tester);
        await theAppIsOnPage(tester, '/notes/new_note');
        await iEnterIntoInputField(tester, "", 0);
        await iEnterIntoInputField(tester, "battery, groceries", 1);
        await iTapIcon(tester, Icons.save);
        await iSeeText(tester, 'Title can not be empty');
      } finally {
        await bddTearDown(tester);
      }
    });
  });
}
