import 'package:hive/hive.dart';
import '../../../../core/error/exception.dart';
import '../models/note_model.dart';

abstract class NoteLocalDataSource {
  Future<List<NoteModel>> getNotes();
  Future<bool> addNote(NoteModel note);
  Future<bool> editNote(NoteModel note);
  Future<bool> deleteNote(NoteModel note);
}

class NoteLocalDataSourceImpl implements NoteLocalDataSource {
  final CollectionBox<Map<dynamic, dynamic>> notesBox;
  const NoteLocalDataSourceImpl({required this.notesBox});
  @override
  Future<List<NoteModel>> getNotes() async {
    final savedNotesMap;
    try {
      Map savedNotesMap = await notesBox.getAllValues();
      List<NoteModel> savedNotes = savedNotesMap.entries
          .map((noteJson) => NoteModel.fromJson(noteJson.value))
          .toList();
      return Future.value(savedNotes);
    } catch (e) {
      print(e);
      throw CacheException();
    }
  }

  @override
  Future<bool> addNote(NoteModel note) async {
    await notesBox.put(note.title, note.toJson());
    return true;
  }

  @override
  Future<bool> editNote(NoteModel note) async {
    await notesBox.put(note.title, note.toJson());
    return true;
  }

  @override
  Future<bool> deleteNote(NoteModel note) async {
    await notesBox.delete(note.title);
    return true;
  }
}
