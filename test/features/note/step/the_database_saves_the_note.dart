import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_notes/features/note/domain/entities/note.dart';

import 'package:my_notes/features/note/domain/repositories/note_repository.dart';
import 'package:my_notes/injection_container.dart';

import '../../../utils/injection_helper.mocks.dart';

Future<void> theDatabaseSavesTheNote(WidgetTester tester) async {
  final mockNoteRepository = sl<NoteRepository>() as MockNoteRepository;
  when(mockNoteRepository.getNotes()).thenAnswer((_) =>
      Future.value(const Right([(Note(content: "content", title: "title"))])));
  when(mockNoteRepository.addNote(any))
      .thenAnswer((realInvocation) => Future.value(const Right(true)));
  when(mockNoteRepository.editNote(any))
      .thenAnswer((realInvocation) => Future.value(const Right(true)));
}
