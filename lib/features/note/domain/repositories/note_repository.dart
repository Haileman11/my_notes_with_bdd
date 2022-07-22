import 'package:dartz/dartz.dart';
import 'package:my_notes/core/error/failure.dart';
import 'package:my_notes/features/note/domain/entities/note.dart';

abstract class NoteRepository {
  Future<Either<Failure, List<Note>>> getNotes();
  Future<Either<Failure, bool>> addNote(Note note);
  Future<Either<Failure, bool>> editNote(Note note);
  Future<Either<Failure, bool>> deleteNote(Note note);
}
