import 'package:my_notes/features/note/data/datasources/note_local_datasource.dart';
import 'package:my_notes/features/note/data/models/note_model.dart';
import 'package:my_notes/features/note/domain/entities/note.dart';
import 'package:my_notes/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  NoteLocalDataSource localDataSource;

  NoteRepositoryImpl({required this.localDataSource});
  @override
  Future<Either<Failure, List<Note>>> getNotes() async {
    try {
      final notes = await localDataSource.getNotes();
      return Right(notes);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> addNote(Note note) async {
    try {
      final response = await localDataSource
          .addNote(NoteModel(title: note.title, content: note.content));
      return Right(response);
    } catch (e) {
      print(e);
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteNote(Note note) async {
    try {
      return Right(await localDataSource.deleteNote(note as NoteModel));
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> editNote(Note note) async {
    try {
      return Right(await localDataSource.editNote(note as NoteModel));
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
