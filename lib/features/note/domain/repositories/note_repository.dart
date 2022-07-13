import 'package:dartz/dartz.dart';
import 'package:my_notes/core/error/failure.dart';
import 'package:my_notes/features/note/domain/entities/note.dart';

abstract class NoteRepository {
  Future<Either<Failure, List<Note>>> getNotes();
  Future<Either<Failure, void>> addNote(Note note);
  Future<Either<Failure, void>> editNote(Note note);
  Future<Either<Failure, void>> deleteNote(Note note);
}
