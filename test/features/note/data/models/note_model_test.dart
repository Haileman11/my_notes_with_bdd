import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:my_notes/features/note/data/models/note_model.dart';
import 'package:my_notes/features/note/domain/entities/note.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  late NoteModel noteModel;
  setUp(() {
    noteModel = const NoteModel(title: "Test title", content: 'Test content');
  });
  test('should be a NumberTrivia entity ', () {
    //execute

    //assert
    expect(noteModel, isA<Note>());
  });
  group('fromJson', () {
    test('should return a NoteModel from note.json', () {
      final note = json.decode(fixture('note'));
      print(note);
      final result = NoteModel.fromJson(note);
      expect(result, NoteModel(content: note['content'], title: note['title']));
    });
  });
  group('toJson', () {
    test('should return a json from a NoteModel ', () {
      final expectedJson = {
        "title": "Test title",
        "content": "Test content",
      };
      final result = noteModel.toJson();
      expect(result, expectedJson);
    });
  });
}
