import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

// StepDefinitionGeneric TapButtonNTimesStep() {
//   return when2<String, int, FlutterWorld>(
//     'I tap the {string} button {int} times',
//     (key, count, context) async {
//       final locator = find.byValueKey(key);
//       for (var i = 0; i < count; i += 1) {
//         await FlutterDriverUtils.tap(context.world.driver, locator);
//       }
//     },
//   );
// }

StepDefinitionGeneric GivenIWantToCreateANewNoteStep() {
  return given<FlutterWorld>(
    'I want to create a note',
    (context) async {
      // final locator = find.byValueKey(key);
    },
  );
}

StepDefinitionGeneric WhenItapButtonStep() {
  return when1<String, FlutterWorld>(
    'I tap the {string} button',
    (key, context) async {
      // final locator = find.byValueKey(key);
      // await FlutterDriverUtils.tap(context.world.driver, locator);
    },
  );
}

StepDefinitionGeneric ThenIShouldBeNavigatedToNewNoteStep() {
  return then<FlutterWorld>(
    'I should be navigated to an empty note',
    (context) async {
      // final locator = find.byValueKey(key);
    },
  );
}

StepDefinitionGeneric GivenIHaveTypedTextStep() {
  return given1<String, FlutterWorld>(
    'I have typed {string}',
    (text, context) async {
      // final locator = find.byValueKey(key);
    },
  );
}

StepDefinitionGeneric WhenISaveTheNoteStep() {
  return when<FlutterWorld>(
    'I save the note',
    (context) async {
      // final locator = find.byValueKey(key);
    },
  );
}

StepDefinitionGeneric ThenISaveTheNoteStep() {
  return then1<String, FlutterWorld>(
    'The text {string} should be saved successfully',
    (text, context) async {
      // final locator = find.byValueKey(key);
    },
  );
}
