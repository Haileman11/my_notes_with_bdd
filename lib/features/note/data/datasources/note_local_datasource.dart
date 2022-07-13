import 'package:hive/hive.dart';
import '../../../../core/error/exception.dart';
import '../models/note_model.dart';

abstract class NoteLocalDataSource {
  Future<List<NoteModel>> getNotes();
  Future<void> addNote(NoteModel note);
  Future<void> editNote(NoteModel note);
  Future<void> deleteNote(NoteModel note);
}

class NoteLocalDataSourceImpl implements NoteLocalDataSource {
  final CollectionBox<Map<String, dynamic>> notesBox;
  const NoteLocalDataSourceImpl({required this.notesBox});
  @override
  Future<List<NoteModel>> getNotes() async {
    final savedNotesMap = await notesBox.getAllValues();
    if (savedNotesMap.isNotEmpty) {
      final savedNotes = savedNotesMap.values
          .map((noteJson) => NoteModel.fromJson(noteJson))
          .toList();
      return Future.value(savedNotes);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> addNote(NoteModel note) async {
    await notesBox.put(note.title, note.toJson());
  }

  @override
  Future<void> editNote(NoteModel note) async {
    await notesBox.put(note.title, note.toJson());
  }

  @override
  Future<void> deleteNote(NoteModel note) async {
    await notesBox.delete(note.title);
  }
}
