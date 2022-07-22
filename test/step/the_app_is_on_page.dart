import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_notes/features/note/domain/repositories/note_repository.dart';
import 'package:my_notes/injection_container.dart';

import '../utils/injection_helper.dart';
import '../utils/injection_helper.mocks.dart';
import '../utils/test_app.dart';

Future<void> theAppIsOnPage(WidgetTester tester, dynamic param1) async {
  final mockNotesRepository = sl<NoteRepository>() as MockNoteRepository;

  when(mockNotesRepository.getNotes())
      .thenAnswer((_) => Future.value(Right([])));
  await tester.pumpWidget(TestMyApp(
    initialRoute: param1,
  ));
  await tester.pumpAndSettle();
}
