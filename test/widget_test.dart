// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_notes/features/note/domain/entities/note.dart';
import 'package:my_notes/features/note/presentation/bloc/notes_list_bloc.dart';
import 'package:my_notes/features/note/presentation/pages/notes_list_view.dart';
import 'package:my_notes/injection_container.dart';

import 'package:my_notes/main.dart';

import 'utils/injection_helper.mocks.dart';

void main() {
  testWidgets('Displays Error text when notes are empty',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.

    final mockRepository = MockNoteRepository();

    when(mockRepository.getNotes()).thenAnswer(
      (_) => Future.value(
        const Right([]),
      ),
    );

    NotesListBloc notesListBloc = NotesListBloc(noteRepository: mockRepository);
    const testKey = Key("EMPTY");
    notesListBloc.add(GetNotesListEvent());
    await tester.pumpWidget(MaterialApp(
        home: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => notesListBloc..add(GetNotesListEvent()),
          child: NotesListView(),
        ),
      ],
      child: NotesListView(),
    )));

    // await tester.pumpAndSettle();
    print(notesListBloc.state);
    // Verify that our counter starts at 0.
    expectLater(find.byKey(testKey, skipOffstage: false), findsOneWidget);
  });
  testWidgets('Displays Notes List when notes are not empty',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.

    final mockRepository = MockNoteRepository();

    when(mockRepository.getNotes()).thenAnswer(
      (_) => Future.value(
        // const Right([]),
        const Right([Note(title: "title", content: "content")]),
      ),
    );

    NotesListBloc notesListBloc = NotesListBloc(noteRepository: mockRepository);
    const testKey = Key("NOTES_LIST");
    notesListBloc.add(GetNotesListEvent());
    await tester.pumpWidget(MaterialApp(
        home: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => notesListBloc..add(GetNotesListEvent()),
          child: NotesListView(),
        ),
      ],
      child: NotesListView(),
    )));

    // await tester.pumpAndSettle();
    print(notesListBloc.state);
    // Verify that our counter starts at 0.
    expectLater(find.byKey(testKey, skipOffstage: false), findsOneWidget);
  });
}
