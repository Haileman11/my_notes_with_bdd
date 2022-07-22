import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_notes/features/note/domain/entities/note.dart';
import 'package:my_notes/features/note/domain/repositories/note_repository.dart';
import 'package:my_notes/injection_container.dart' as di;
import '../utils/injection_helper.dart';
import '../utils/injection_helper.mocks.dart';

Future<void> theSavedNotesListIsEmpty(WidgetTester tester) async {
  final mockNotesRepository = di.sl<NoteRepository>() as MockNoteRepository;

  when(mockNotesRepository.getNotes())
      .thenAnswer((_) => Future.value(const Right([])));
}
